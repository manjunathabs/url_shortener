Rails.application.routes.draw do
 #  get 'urls/new'

  root 'urls#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'urls/create'

  get 'urls/show'
end
