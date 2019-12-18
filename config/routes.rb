Rails.application.routes.draw do
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
  get '/about', to: 'home#about_us'
  get '/privacy_and_policy', to: 'home#privacy_and_policy'
  get '/mentor-schedules', to: 'schedule_booking#index', as: 'mentor_schedules'
  get '/booking-schedule', to: 'schedule_booking#booking_schedule', as: 'booking_schedule'
  root 'home#index'
  resources :blogs
  resources :comments

  scope :dashboard do
    get '/', to: "dashboard#index"
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
