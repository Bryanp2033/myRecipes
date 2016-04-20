Rails.application.routes.draw do

  root 'pages#home'

  get '/home', to: 'welcome#home'

  resources :recipes
end
