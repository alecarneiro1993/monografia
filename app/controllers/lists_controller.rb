class ListsController < ApplicationController
  require 'will_paginate/array'
  before_action :set_list, only: [:show, :edit, :update, :destroy, :results]
  before_action :set_current_user
  before_action :check_professor, only: [:new, :edit, :update, :destroy]
  # GET /lists
  # GET /lists.json
  def index
    @resource = "List"
    @resource_new_path = new_list_path
    if @user.role.name == "professor"
      @lists = @user.lists.paginate(page: params[:page], per_page: 6)
      if @lists.count == 0
        @noResource = "Ahh boo ;(! <br /> You have no lists created.".html_safe
      end
    else
      @lists = List.all.paginate(page: params[:page], per_page: 6)
      if @lists.count == 0
        @noResource = "Ahh boo ;(! <br /> You have no lists to try.".html_safe
      end
    end
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
      @questions = []
      @result = Result.new
      @ids = @list.question_ids
      @ids.each do |i|
        @q = Question.find(i)
        @questions << @q
      end
      @questions = @questions.paginate(page: params[:page], per_page: 1)
  end


  def send_results
    @result = Result.create(result_params)
    @result.save
  end

  def results
    @correct = Result.where(:user_id => current_user.id, :list_id => @list.id, :correct => true).group(:correct).count
    @incorrect = Result.where(:user_id => current_user.id, :list_id => @list.id, :correct => false).group(:correct).count
  end



  # GET /lists/new
  def new
    @list = List.new
    @questions = @user.questions
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)
    @list.user_id = @user.id
    @list.question_ids = params[:list][:question_ids].split(',').map { |s| s.to_i }
      if @list.save
        redirect_to lists_path
      else
        redirect_to new_list_path
      end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:title, :question_ids, question_ids: [])
    end

    private
    #Set Current user on platform
    def set_current_user
      @user = current_user
    end

    private
    def check_professor
      if @user.role.name != "professor"
        redirect_to root_path
      end
    end

    def result_params
      params.require(:result).permit(:user_id, :question_id, :list_id, :correct)
    end

    def all_questions_answered_status(user, list)
      @attempted = Result.where(:user_id => user.id, :list_id => list.id)
      if @attempted.count == list.question_ids.count
        return true
      else
        return false
      end
    end

    helper_method :all_questions_answered_status

    def build_questions_for_list
      puts "heyyyyy"
    end
end
