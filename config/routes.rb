Rails.application.routes.draw do
  devise_for :users
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

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
    resources :categories, only: %i[index show create]
    resources :images, only: %i[index create]
  end



  get 'top/contact' => 'top#contact'
  get 'top/link' => 'top#link'
  get '*path', to: 'application#render_404' if Rails.env.production?

end
