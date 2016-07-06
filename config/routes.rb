Rails.application.routes.draw do

  get 'logins/new'

  root 'static_pages#home'

  get 'about' => 'static_pages#about'

  get 'contact' => 'static_pages#contact'

  get 'signup' => 'users#new'

  get 'login' => 'logins#new'

  post 'login' => 'logins#create'
  delete 'logout' => 'logins#destroy'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
