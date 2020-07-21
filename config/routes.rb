Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "user#index"
  post "sign_in" => "user#sign_in"
  get "sign_out" => "user#sign_out"
  get "dashboard/charts" => "dashboard#charts"
  post "dashboard/charts" => "dashboard#charts"
  resources :user, only:[:index]
  resources :dashboard, only:[:index]
  resources :node
  resources :reading, only:[:new]
end
