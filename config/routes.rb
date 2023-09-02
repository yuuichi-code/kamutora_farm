Rails.application.routes.draw do
  root 'posts#index'
  resources :users, only: %i[show new create edit]
  get 'login' => 'user_sessions#new'
  post 'login' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy'
end
