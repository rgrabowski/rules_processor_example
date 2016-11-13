Rails.application.routes.draw do
  resources :rules do
    collection do
      get :add_condition_fields
      get :handle_condition_fields
      get :add_action_fields
      get :handle_action_fields
    end
  end
  resources :tickets
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
