Rails.application.routes.draw do
  root 'welcome#welcome'
  #shelters
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  get '/shelters/:id', to: 'shelters#show'
  post '/shelters', to: 'shelters#create'
  patch '/shelters/:id', to: 'shelters#update'
  get '/shelters/:id/edit', to: 'shelters#edit'
  get '/shelters/:id/delete', to: 'shelters#destroy'
  get '/shelters/:id/review', to: 'reviews#new'
  post '/shelters/:id/review', to: 'reviews#create'
  get '/shelters/:id/review/:review_id/edit', to: 'reviews#edit'
  patch '/shelters/:id/review/:review_id', to: 'reviews#update'
  get '/shelters/:id/review/:review_id/delete', to: 'reviews#destroy'
  #pets
  get '/pets', to: 'pets#index'
  get '/shelters/:id/pets', to: 'shelterpets#index'
  get '/pets/:id', to: 'pets#show'
  get '/shelters/:id/pets/new', to: 'pets#new'
  post '/shelters/:id/pets', to: 'pets#create'
  patch 'pets/:id', to: 'pets#update'
  get '/pets/:id/edit', to: 'pets#edit'
  get '/pets/:id/delete', to: 'pets#destroy'
  #users
  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show'
  #applications
  get '/applications/user_validation', to: 'applications#user_validation'
  post '/applications', to: 'applications#create'
  get '/applications/:id', to: 'applications#show'
end

# question: should we change the review delete path to delete