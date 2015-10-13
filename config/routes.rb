Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show] do
        resources :lists, only: [:index]
      end

      resources :lists, only: [:index, :show, :create] do
        resources :items, only: [:index]
      end

      resources :items, only: [:create, :index, :show]

      resources :list_items, only: [:create, :destroy]
    end
  end
end
