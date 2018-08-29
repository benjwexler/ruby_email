Rails.application.routes.draw do
  devise_for :users
  resources :enrollments 
 
  resources :cohorts
  resources :courses
  resources :instructors
  resources :students do 
      resources :enrollments
    end 

    # resources :students 
  

  root 'instructors#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
