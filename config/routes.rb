Rails.application.routes.draw do

  root 'welcome#home'

  get '/home', to: 'welcome#home'

  resources :recipes do
  	member do
  		post 'like'
  	end
  end
end
