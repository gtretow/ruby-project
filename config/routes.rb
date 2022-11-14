Rails.application.routes.draw do
  devise_for :students
  devise_for :professors
  resources :university_subjects
  root 'home#index'
end
