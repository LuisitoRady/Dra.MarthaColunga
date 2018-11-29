Rails.application.routes.draw do
  get 'sessions/new'
	root 'welcome#home'
  resources :users
  resources :treatments
  resources :archives
  resources :appointments
  resources :medicines
  resources :pacients, controller: 'users', type: 'Pacient' 
	resources :secretaries, controller: 'users', type: 'Secretary' 
	resources :admins, controller: 'users', type: 'Admin'
	get 'login', to: 'login#new'
  post 'login', to: 'login#create'
  delete 'logout', to: 'login#destroy'
end
