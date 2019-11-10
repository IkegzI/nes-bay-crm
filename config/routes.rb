Rails.application.routes.draw do
  resources 'contact'
  resources 'region'
  get 'contact/destroy'
  root 'company#index'

  # get 'company/create'
  # get 'company/new' => 'company#new'
  post 'company/new' => 'company#save'
  post 'company/:id' => 'company#update'

  post 'contact/new' => 'contact#create'
  post 'contact/:id' => 'contact#update'

  post 'region/new' => 'region#create'
  post 'region/:id' => 'region#update'
  # get 'company/delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  resources 'company'

  # get 'region/new'
  # get 'region/index'
  # get 'region/destroy'
  # get 'region/show'
  # get 'contact/new'
  # get 'contact/create'
  # get 'contact/index'
  # get 'contact/show'
end
