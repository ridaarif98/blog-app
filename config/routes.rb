Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Nested routes allow you to capture this relationship in your routing

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
end
