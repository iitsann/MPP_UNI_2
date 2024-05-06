Rails.application.routes.draw do
  root "home#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {registrations: "users/registrations"}
  get "posts/user_posts/:id", to: "posts#user_posts", as: "user_posts"
  get "home", to: "home#index", as: "home"
  get "about", to: "pages#about"
  get "privacy_policy", to: "pages#privacy_policy"
  get "terms_of_service", to: "pages#terms_of_service"
  resources :posts
  resources :hobbies
  resources :profiles do
    patch :update_hobbies, on: :member
    post "create_chat", on: :member
    resources :private_chats, only: %i[index show] do
      resources :messages, only: [:create]
    end
  end
  resources :posts do
    member do
      put "like"
      put "dislike"
    end
  end
  resources :topics
end
