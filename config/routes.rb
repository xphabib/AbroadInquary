Rails.application.routes.draw do
  post 'editor_images', to: 'editor_images#index'
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
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
  get '/about-us', to: 'home#about_us', as: 'about_us'
  get '/privacy_and_policy', to: 'home#privacy_and_policy'
  get '/terms_and_conditions', to: 'home#terms_and_condition'
  get '/refund_policy', to: 'home#refund_policy'
  get '/mentor-schedules', to: 'schedule_booking#index', as: 'mentor_schedules'
  get '/booking-schedule', to: 'schedule_booking#booking_schedule', as: 'booking_schedule'
  post 'update_schedule_booking', to: 'schedule_booking#update_schedule_booking', as: 'update_schedule_booking'
  root 'home#index'

  resources :scholarships, only: [:index, :show]
  resources :services, only: :index
  resources :countries, only: [:index, :show]
  resources :blogs
  resources :comments

  scope :dashboard do
    get '/', to: "dashboard#index", as: :dashboard
    resources :student_applications
    resources :users do
      collection do
        get :my_profile
        get :edit_my_profile
        post :update_my_profile
        # get :request_for_new_mentorship
        # post :create_request_for_new_mentorship
      end
    end
    resources :schedules do
      collection do
        get :booking_schedule
        get :booked_users
      end
    end
  end

  get 'request-mentorship', to: 'users#request_for_new_mentorship', as: :request_for_new_mentorship
  post 'create-mentorship', to: 'users#create_request_for_new_mentorship', as: :create_request_for_new_mentorship

end
