Rails.application.routes.draw do
  get 'talk' => 'talk#new'
  post 'talk' => 'talk#create'
  get 'login' => 'session#new'
  post 'login' => 'session#create'
  delete 'logout' => 'session#destroy'
  root 'session#new'
  resources 'user'
  resources 'role'
  resources 'contact'
  resources 'region'
  resources 'company'

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

end
