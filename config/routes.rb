Rails.application.routes.draw do
  get 'users/authenticate'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'users#authenticate'
end
