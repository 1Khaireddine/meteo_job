Rails.application.routes.draw do
  resources :companies
  get 'home/index'
  resources :candidates
  resources :superadmins
  resources :admins
  devise_for :users

  root to: 'home#index'

  namespace :admin do
    resources :offers do
      member do
        get :posts
      end
    end
  end


  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
