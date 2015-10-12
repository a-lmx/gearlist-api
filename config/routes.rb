Rails.application.routes.draw do
  scope "/api" do
    resources :items, only: [:index]
  end
end
