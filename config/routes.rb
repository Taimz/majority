Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, :defaults => {:format => :json}do
    resources :users, only: [:create, :show]
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
  end
end
