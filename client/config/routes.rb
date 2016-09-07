Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  get "/user_logged_in", to: "home#user_logged_in", as: "user_logged_in"

  devise_scope :user do
    get "/users/sign_in", to: "users/sessions#new", as: "new_user_session"
    post "/users/sign_in", to: "users/sessions#create", as: "session"
    delete "/users/sign_out", to: "users/sessions#destroy", as: "destroy_user_session"
    get "/users/sign_out", to: "users/sessions#destroy"
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

end
