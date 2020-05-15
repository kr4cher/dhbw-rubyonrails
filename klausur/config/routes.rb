Rails.application.routes.draw do
  root 'patients#index'

  resources :infections
  resources :patients
  resources :doctors
  resources :laboratories

  resources :test_patient, controller: 'patients'
  resources :sample_laboratory, controller: 'laboratories'
  resources :see_doctor, controller: 'doctors'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
