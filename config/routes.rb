Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'signin', sign_out: 'signout', password: 'secret', confirmation: 'verification', unlock: 'unblock', sign_up: 'signup' }
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

  get '/projects' => 'users#projects'
  get 'search' => 'search#index'
  
  resources :identification, only: [:new, :create]  
  resources :projects

  root 'projects#index'
end
