Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [] do
        resources :lists, only: [:index]
      end

      resources :lists, only: [:create] do
        resources :items, only: [:index]
      end

      # :index and :show are for debugging
      resources :items, only: [:create, :index, :show]

      resources :list_items, only: [:create, :destroy]
    end
  end
end
