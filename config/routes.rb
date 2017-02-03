Rails.application.routes.draw do
  get 'homes/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'parks#index'

# get 'parks', to: 'parks#index'
# get 'parks/:id', to: 'parks#show'


resources :parks


end
