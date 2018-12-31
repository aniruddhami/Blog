Rails.application.routes.draw do
  
  devise_for :admins
  get 'pages/how_to_write'

  get 'pages/Myblogs'

  devise_for :users
  resources :blogs
  
  get 'pages/signup'

  root 'pages#home'

  get 'pages/contactus'

  get 'pages/about'
  
  get 'pages/show_detailed_blog'


  
 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
