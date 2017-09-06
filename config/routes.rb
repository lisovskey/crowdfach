Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'signin', sign_out: 'signout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'signup' }
  resources :users, only: [:index, :show] do
    collection do
      get 'touch'
    end
    member do
      put 'rate'
      put 'ban'
      put 'unban'
    end
  end

  resources :projects

  get 'search' => 'search#index'

  root 'projects#index'
end
