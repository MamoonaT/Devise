Rails.application.routes.draw do
  devise_for :admin_users
  
  resources :posts
  resources :news
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'users#index'

end
