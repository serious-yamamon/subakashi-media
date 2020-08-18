Rails.application.routes.draw do
  root 'top#index'
  resources :posts, only: %i[index show]
  resources :categories, only: %i[show]
  resources :tags, only: %i[index show]
  resources :about, only: %i[index]

  namespace :admin do
    root 'home#index'
    resources :posts, only: %i[new create edit update destroy] do
      get :all, :published, :drafts, on: :collection
    end
    resources :categories, only: %i[index show create edit update destroy]
    resources :images, only: %i[index create]
    resources :writers, only: %i[index edit update]
    post 'writers/:id/prof_img' => 'writers#prof_img'
    resources :series, only: %i[index show create edit update destroy]
  end



  get 'top/contact' => 'top#contact'
  get 'top/link' => 'top#link'
  get '/sign_in_6851' => 'top#sign_in'
  post '/login' => 'top#login'
  post '/logout' => 'top#logout'

  get '*path', to: 'application#render_404' if Rails.env.production?

end
