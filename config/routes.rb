Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'top#index'


  get 'top/index'


  resources :images, only: [:index, :create]
  root "images#index"

end
