Rails.application.routes.draw do
  devise_for :students
  devise_for :professors

  devise_scope :student do  
    get '/students/sign_out' => 'devise/sessions#destroy'   
  end

  devise_scope :professor do  
    get '/professors/sign_out' => 'devise/sessions#destroy'   
  end


  resources :university_subjects
  root 'home#index'
end
