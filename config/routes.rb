Rails.application.routes.draw do
  mount RailsAdmin::Engine => 'admin'
  mount Commontator::Engine => 'commontator'

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

  resources :projects do
    resources :donations, only: [:index, :show, :create]
  end

  get 'validation' => 'validations#new'
  get 'categories/:name' => 'categories#show', as: :category
  get 'explore/:name' => 'sections#show', as: :section
  get 'search' => 'results#index'

  post 'validation' => 'validations#create', as: :validations

  root 'sections#index'
end
