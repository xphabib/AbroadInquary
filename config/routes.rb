Rails.application.routes.draw do
  devise_for :users, controllers:
      {
          sessions: 'users/sessions',
          confirmations: 'users/confirmations',
          passwords: 'users/passwords',
          registrations: 'users/registrations',
          unlocks: 'users/unlocks',
          omniquth: 'users/omniquth'
      }
  get 'home/index'
  get '/contact', to: 'home#contact'
  root 'home#index'
  resources :blogs

  scope :dashboard do
    get '/', to: "dashboard#index"
  end

end
