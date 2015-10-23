Rails.application.routes.draw do
  get 'list_sections/index'

  namespace :api do
    namespace :v1 do
      resources :users, only: [:show] do
        resources :lists, only: [:index]
      end

      resources :lists, only: [:index, :show, :create] do
        get 'sections', to: 'list_sections#index'
        post 'items', to: 'list_section_items#add_items'
      end
      
      get 'list-sections/:list_section_id/items', to: 'list_section_items#index', as: 'complete_list_items'

      resources :items, only: [:create, :index, :show]
      resources :list_section_items, only: [:show]

      post '/login', to: 'sessions#create'
    end
  end
      # root to: 'sessions#new'
      # resources :sessions, only: :index
      # get "/auth/:provider/callback" => 'sessions#create'
end
