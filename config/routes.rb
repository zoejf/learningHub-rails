Rails.application.routes.draw do

  #pages routes
  root 'pages#index'
  get '/about', to: 'pages#about'

  #resources
  get '/resources/:name', to: 'resources#show', as: 'resource'
  get '/admin/resources/new', to: 'resources#new'
  resources :resources, except: [:show, :new]

  #tags
  get '/tags/:text', to: 'tags#show', as: 'tag'
  resources :tags, except: [:show]

  #sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  #users
  get '/signup', to: 'users#new'
  get '/profile', to: 'users#show'
  resources :users, only: [:create]

  #bookmarks
  resources :bookmarks, only: [:create, :destroy]

  #endorsements
  resources :endorsements, only: [:create, :destroy]

  #comments
  get "/resources/:id/comments", to: "comments#new", as: "new_comment"
  post "/resources/:id/comments", to: "comments#create"
  resources :comments, except: [:new, :create, :show]

end

#  Prefix Verb   URI Pattern                       Controller#Action
#          root GET    /                                 pages#index
#         about GET    /about(.:format)                  pages#about
#      resource GET    /resources/:name(.:format)        resources#show
#     resources GET    /resources(.:format)              resources#index
#               POST   /resources(.:format)              resources#create
#  new_resource GET    /resources/new(.:format)          resources#new
# edit_resource GET    /resources/:id/edit(.:format)     resources#edit
#               PATCH  /resources/:id(.:format)          resources#update
#               PUT    /resources/:id(.:format)          resources#update
#               DELETE /resources/:id(.:format)          resources#destroy
#           tag GET    /tags/:text(.:format)             tags#show
#          tags GET    /tags(.:format)                   tags#index
#               POST   /tags(.:format)                   tags#create
#       new_tag GET    /tags/new(.:format)               tags#new
#      edit_tag GET    /tags/:id/edit(.:format)          tags#edit
#               PATCH  /tags/:id(.:format)               tags#update
#               PUT    /tags/:id(.:format)               tags#update
#               DELETE /tags/:id(.:format)               tags#destroy
#         login GET    /login(.:format)                  sessions#new
#               POST   /login(.:format)                  sessions#create
#        logout GET    /logout(.:format)                 sessions#destroy
#        signup GET    /signup(.:format)                 users#new
#       profile GET    /profile(.:format)                users#show
#         users POST   /users(.:format)                  users#create
#     bookmarks POST   /bookmarks(.:format)              bookmarks#create
#      bookmark DELETE /bookmarks/:id(.:format)          bookmarks#destroy
#  endorsements POST   /endorsements(.:format)           endorsements#create
#   endorsement DELETE /endorsements/:id(.:format)       endorsements#destroy
#   new_comment GET    /resources/:id/comments(.:format) comments#new
#               POST   /resources/:id/comments(.:format) comments#create
#      comments GET    /comments(.:format)               comments#index
#  edit_comment GET    /comments/:id/edit(.:format)      comments#edit
#       comment PATCH  /comments/:id(.:format)           comments#update
#               PUT    /comments/:id(.:format)           comments#update
#               DELETE /comments/:id(.:format)           comments#destroy

