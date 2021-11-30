# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#index'
  get 'posts/index'
  get 'posts/show'
  get 'users/show'
  get 'users/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Nested routes allow you to capture this relationship in your routing

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show]
  end
end
