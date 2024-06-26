Rails.application.routes.draw do
  resources :lessons do
    get :complete_lesson
  end
  resources :course_modules do
    get :enroll_to_course_module
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check

  # Defines the root path route ("/")
  devise_scope :user do
    root to: "course_modules#index"
  end
end
