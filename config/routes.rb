Rails.application.routes.draw do

  resources 'role'
  resources 'contact'
  resources 'region'
  resources 'company'

  root 'company#index'

  # get 'company/create'
  # get 'company/new' => 'company#new'
  post 'company/new' => 'company#create'
  post 'company/:id' => 'company#update'

  post 'contact/new' => 'contact#create'
  post 'contact/:id' => 'contact#update'

  post 'region/new' => 'region#create'
  post 'region/:id' => 'region#update'

  post 'role/new' => 'role#create'
  post 'role/:id' => 'role#update'

    # get 'company/delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #

end
