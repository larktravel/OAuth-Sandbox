Rails.application.routes.draw do
  use_doorkeeper
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
end
