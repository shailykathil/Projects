Rails.application.routes.draw do
  devise_for :users
  resources :categories
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'projects#index'
  
  resources :projects do
  	collection do
     get :members
  	end
  	
  resources :members
  
  resources :comments

  resources :comments do
  resources :replies
 	
end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html 

end
