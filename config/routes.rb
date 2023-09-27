Rails.application.routes.draw do
  root 'posts#index'
  resources :users, only: %i[show new create edit]
  get 'login' => 'user_sessions#new'
  post 'login' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy'
  get 'step1' => 'posts#step1'
  post 'create_step1' => 'posts#create_step1'
  get 'step2' => 'posts#step2'
  post 'create_step2' => 'posts#create_step2'
  resources :posts, only: %i[create]
end
