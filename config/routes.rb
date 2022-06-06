Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  resources :quizzes
  resources :answers, only: %i[new create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
