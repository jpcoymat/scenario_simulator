Rails.application.routes.draw do
  devise_for :users
  resources :organizations do
    resources :products
    resources :locations
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "organizations#index"  

end
