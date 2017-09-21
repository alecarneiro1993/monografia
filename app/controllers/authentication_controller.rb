class AuthenticationController < ApplicationController
    
  def index
    path = case current_user.role.name
      when 'professor'
        questions_path
      when 'aluno'
        lists_path
    end
    redirect_to path    
  end
end
