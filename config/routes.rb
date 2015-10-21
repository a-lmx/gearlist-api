Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show] do
        resources :lists, only: [:index]
      end

      resources :lists, only: [:index, :show, :create] do
        resources :list_items, only: [:index]
        resources :items, only: [:index]
        resources :sections, only: [:index] do
        end
      end
      get '/lists/:list_id/complete_list_items', to: 'list_items#complete', as: 'complete_list_items'
      get '/lists/:list_id/items_by_section', to: 'lists#items_by_section', as: 'items_by_section'

      resources :items, only: [:create, :index, :show]

      resources :list_items, only: [:index, :show, :create, :destroy]
    end
  end
end
