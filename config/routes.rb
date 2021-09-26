Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tasks#index'
  delete    :tasks, to: 'tasks#destroy_all'
  resources :tasks
end
