Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show] do
        resources :lists, only: [:index]
      end

      resources :lists, only: [:index, :show, :create] do
        resources :items, only: [:index]
        resources :list_items, only: [:index]
      end
      get '/lists/:list_id/complete_list_items', to: 'list_items#complete', as: 'complete_list_items'

      resources :items, only: [:create, :index, :show]

      resources :list_items, only: [:index, :show, :create, :destroy]
    end
  end
end
