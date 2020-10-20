Rails.application.routes.draw do
  root 'welcome#welcome'
  # shelters
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  get '/shelters/:id', to: 'shelters#show'
  post '/shelters', to: 'shelters#create'
  patch '/shelters/:id', to: 'shelters#update'
  get '/shelters/:id/edit', to: 'shelters#edit'
  delete '/shelters/:id', to: 'shelters#destroy'
  get '/shelters/:id/review', to: 'reviews#new'
  post '/shelters/:id/review', to: 'reviews#create'
  get '/shelters/:id/review/:review_id/edit', to: 'reviews#edit'
  patch '/shelters/:id/review/:review_id', to: 'reviews#update'
  delete '/shelters/:id/review/:review_id', to: 'reviews#destroy'
  # pets
  get '/pets', to: 'pets#index'
  get '/shelters/:id/pets', to: 'shelterpets#index'
  get '/pets/:id', to: 'pets#show'
  get '/shelters/:id/pets/new', to: 'pets#new'
  post '/shelters/:id/pets', to: 'pets#create'
  patch 'pets/:id', to: 'pets#update'
  get '/pets/:id/edit', to: 'pets#edit'
  delete '/pets/:id', to: 'pets#destroy'
  # users
  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show'
  # applications
  get '/applications/user_validation', to: 'applications#user_validation'
  post '/applications', to: 'applications#create'
  get '/applications/:id', to: 'applications#show'
  patch '/applications/:id', to: 'applications#update'
  patch '/applications/:id/update_pet', to: 'applications#update_pet'
  # admin
  get '/admin/applications/:id', to: 'admin#show'
  patch 'admin/applications/:id/approve', to: 'admin#approve_pet'
  patch 'admin/applications/:id/reject', to: 'admin#reject_pet'
end

# question: should we change the review delete path to delete