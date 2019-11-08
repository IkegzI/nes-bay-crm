Rails.application.routes.draw do
  get 'contact/new'
  get 'contact/create'
  get 'contact/index'
  get 'contact/show'
  get 'contact/destroy'
  root 'company#index'
  resources 'company'
  # get 'company/create'
  get 	'company/new' => 'company#new'
  post 	'company/new' => 'company#save'
  post 	'company/:id' => 'company#update'
  # get 'company/delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
