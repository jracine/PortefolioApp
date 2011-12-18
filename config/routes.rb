LoginApp::Application.routes.draw do

  get "pages/home"

  get "pages/admin"
  post "images/createNoId"
  #get "portefolio" => "portefolio#show", :as => "portefolio"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  root :to => "pages#home"
  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :images
end
