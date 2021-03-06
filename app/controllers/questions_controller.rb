class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy, :set_answer, :send_answer]
  before_action :set_current_user
  before_action :check_professor

  # GET /questions
  # GET /questions.json
  def index
    @resource = "Question"
    @resource_new_path = new_question_path
    if @user.role.name == "professor"
      @questions = @user.questions.paginate(page: params[:page], per_page: 6)
      if @questions.count == 0
        @noResource = "Ahh boo ;(! <br /> You have no questions created.".html_safe
      end
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @question.user_id = @user.id
    if @question.save
      redirect_to set_answer_question_path(@question)
    else
      redirect_to new_question_path
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
      if @question.update(question_params)
        redirect_to set_answer_question_path(@question)
      end
  end

  def set_answer
  end

  def send_answer
    if @question.update_attribute(:answer, params[:question][:answer].split(',').map { |s| s.to_i })
      redirect_to questions_path, notice: 'Question was created and answer was set.'
    else
      redirect_to set_answer_question_path(@question)
    end
  end


  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :description, :images, {images: []}, :answer, answer: [])
    end


  private
  #Set Current user on platform
  def set_current_user
    @user = current_user
  end

  def check_professor
    if @user.role.name != "professor"
      redirect_to root_path
    end
  end
end
