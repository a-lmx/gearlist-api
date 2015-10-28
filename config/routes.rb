Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show] do
        resources :lists, only: [:index]
      end
      
      get '/lists/search', to: 'lists#search'

      resources :lists, only: [:index, :show, :create, :update, :destroy] do
        get 'sections', to: 'list_sections#index'
        post 'items', to: 'list_section_items#add_items'
      end

      resources :sections, only: [:index]
      
      get 'list-sections/:list_section_id/items', to: 'list_section_items#index', as: 'complete_list_items'
      get 'items/:id', to: 'list_section_items#show', as: 'items'
      put 'items/:id', to: 'list_section_items#update'
      delete 'items/:id', to: 'list_section_items#destroy'

      # resources :items, only: [:show]
      resources :list_section_items, only: [:show]

      post '/login', to: 'sessions#create'
    end
  end
end
