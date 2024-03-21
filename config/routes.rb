Rails.application.routes.draw do
  resources :reddits
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'home#index'
  devise_for :users
  get 'home', to: 'home#index', as: 'home'
  get 'about', to: 'pages#about'
  get 'privacy_policy', to: 'pages#privacy_policy'
  get 'terms_of_service', to: 'pages#terms_of_service'
  resources :posts
  resources :posts do
    member do
      put 'like'
      put 'dislike'
    end
  end
  resources :topics
end
