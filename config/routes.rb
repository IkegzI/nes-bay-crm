Rails.application.routes.draw do
  root 'company#index'
  resources 'company'
  # get 'company/create'
  get 	'company/new' => 'company#new'
  post 	'company/new' => 'company#save'
  post 	'company/:id' => 'company#update'
  # get 'company/delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
