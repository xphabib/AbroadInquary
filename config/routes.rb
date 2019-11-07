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
  get '/faq', to: 'home#faq'
  get '/about', to: 'home#about_us'
  root 'home#index'
  resources :blogs

  scope :dashboard do
    get '/', to: "dashboard#index"
    resources :student_applications
    resources :users
    resources :schedules do
      collection do
        get :booking_schedule
        get :booked_users
      end
    end
  end
end
