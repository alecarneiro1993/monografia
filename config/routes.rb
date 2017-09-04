Rails.application.routes.draw do
  
  resources :questions
  
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  devise_scope :user do
  get 'users', to: 'devise/sessions#new'
end
  
  authenticate :user do
   root to: 'questions#index'
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
