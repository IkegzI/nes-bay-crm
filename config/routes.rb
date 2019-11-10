Rails.application.routes.draw do

  # get 'user/create'
  # get 'user/show'
  # get 'user/index'
  # get 'user/destroy'
  # get 'user/edit'
  # get 'user/update'
  resources 'user'
  resources 'role'
  resources 'contact'
  resources 'region'
  resources 'company'

  root 'company#index'

  # get 'company/create'
  # get 'company/new' => 'company#new'
  post 'company/new' => 'company#create'
  post 'company/:id/edit' => 'company#update'

  post 'contact/new' => 'contact#create'
  post 'contact/:id/edit' => 'contact#update'

  post 'region/new' => 'region#create'
  post 'region/:id/edit' => 'region#update'

  post 'role/new' => 'role#create'
  post 'role/:id/edit' => 'role#update'

  post 'user/new' => 'user#create'
  post 'user/:id/edit' => 'user#update'
    # get 'company/delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #

end
