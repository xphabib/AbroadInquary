Rails.application.routes.draw do
  resources :student_applications
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
  get '/faq', to: 'home#faq'
  get '/about', to: 'home#about_us'
  root 'home#index'
  resources :blogs

  scope :dashboard do
    get '/', to: "dashboard#index"
    resources :users
  end
end
