Rails.application.routes.draw do

  #pages routes
  root 'pages#index'
  get '/about', to: 'pages#show'

  #resources
  resources :resources

  #tags
  resources :tags

  #sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  #users
  get '/signup', to: 'users#new'
  get '/profile', to: 'users#show'
  resources :users, only: [:create]

end

# Prefix Verb   URI Pattern                   Controller#Action
#          root GET    /                             pages#index
#         about GET    /about(.:format)              pages#show
#     resources GET    /resources(.:format)          resources#index
#               POST   /resources(.:format)          resources#create
#  new_resource GET    /resources/new(.:format)      resources#new
# edit_resource GET    /resources/:id/edit(.:format) resources#edit
#      resource GET    /resources/:id(.:format)      resources#show
#               PATCH  /resources/:id(.:format)      resources#update
#               PUT    /resources/:id(.:format)      resources#update
#               DELETE /resources/:id(.:format)      resources#destroy
#          tags GET    /tags(.:format)               tags#index
#               POST   /tags(.:format)               tags#create
#       new_tag GET    /tags/new(.:format)           tags#new
#      edit_tag GET    /tags/:id/edit(.:format)      tags#edit
#           tag GET    /tags/:id(.:format)           tags#show
#               PATCH  /tags/:id(.:format)           tags#update
#               PUT    /tags/:id(.:format)           tags#update
#               DELETE /tags/:id(.:format)           tags#destroy
#         login GET    /login(.:format)              sessions#new
#               POST   /login(.:format)              sessions#create
#        logout GET    /logout(.:format)             sessions#destroy
#        signup GET    /signup(.:format)             users#new
#       profile GET    /profile(.:format)            users#show
#         users POST   /users(.:format)              users#create
