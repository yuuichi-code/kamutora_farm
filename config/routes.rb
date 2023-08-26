Rails.application.routes.draw do
  root 'posts#index'
  resources :users, only: %i[show new create edit]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
