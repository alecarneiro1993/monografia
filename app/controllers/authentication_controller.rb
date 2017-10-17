class AuthenticationController < ApplicationController

  def index
   if user_signed_in?
    path = case current_user.role.name
      when 'professor'
        questions_path
      when 'aluno'
        lists_path
    end
    redirect_to path
  else
    redirect_to new_user_session_path
  end
  end
end
