Rails.application.routes.draw do
  resources :contacts, only: [:new, :create, :show]

  root 'pages#index'

end
