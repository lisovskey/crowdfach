Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin'
  devise_for :users, path: '', path_names: { sign_in: 'signin', sign_out: 'signout', password: 'secret', confirmation: 'verification', unlock: 'unblock', sign_up: 'signup' },
                     controllers: { registrations: 'users/registrations' }
  resources :users, only: [:index, :show] do
    collection do
      get 'touch'
    end
    
    member do
      put 'rate'
    end
  end

  resources :projects, except: :index do
    member do
      post 'donate'
    end
  end

  get '/projects' => 'users#projects'
  get 'search' => 'results#index'
  
  resources :categories, path: '', only: :show, param: :name
  resources :validations, only: [:new, :create]  

  root 'sections#index'
end
