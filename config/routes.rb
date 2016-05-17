Rails.application.routes.draw do

  root 'welcome#home'

  get '/home', to: 'welcome#home'

  resources :recipes do
    resources :reviews, only: [:create]
  	member do
  		post 'like'
  	end
  end


  resources :chefs, except: [:new, :destroy]

  get '/register', to: 'chefs#new'

  get '/login', to: "logins#new"
  post '/login', to: "logins#create"
  get '/logout', to: "logins#destroy"

  resources :styles, only: [:new, :create, :show]
  resources :ingredients, only: [:new, :create, :show]



end
