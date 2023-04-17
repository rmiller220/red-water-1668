Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 get '/dishes/:id', to: 'dishes#show'
 post '/dishes/:id', to: 'dishes#create'

 resources :chefs, only: [:show] do
  resources :ingredients, only: [:index]
 end
#  get '/chefs/:id', to: 'chefs#show'
#  get '/chefs/:id/ingredients', to: 'chefs#ingredients'
end
