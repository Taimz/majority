Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # TODO: add api versioning
  namespace :api, :defaults => {:format => :json} do
    resources :users, only: [:create] do
      collection do
        get :me
      end
    end
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
  end
end
