Rails.application.routes.draw do
  resources :audit_logs, expect: [:new, :edit, :destroy]

  namespace :admin do
    resources :users
    resources :posts
    resources :admin_users

    root to: "users#index"
  end

  resources :posts do
    member do   # view static/homepage --> _admin -> pending_approval  --> create approve_post_path
      get :approve  # appove post by click on the approve button
    end             # create method approve in posts_controller.rb
  end


  devise_for :users
  root to: 'static#homepage'
end
