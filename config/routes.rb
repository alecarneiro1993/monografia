Rails.application.routes.draw do
  get '/lists/:id/results' => 'lists#results', as: 'list_results'
  post '/list/:id', :controller => 'lists', :action => 'send_results'
  resources :lists

  get '/questions/:id/set_answer' => 'questions#set_answer', as: 'set_answer_question'
  patch "questions/:id/set_answer", to: "questions#send_answer"
  resources :questions


  devise_for :users, :controllers => {:registrations => "registrations"}

  devise_scope :user do
    post 'users/sign_up', to: 'devise/registrations#create'
  end

  root :to => 'authentication#index'
end
