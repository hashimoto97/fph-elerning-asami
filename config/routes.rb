Rails.application.routes.draw do
  get 'results/index'
  root 'home#index'
  get '/signup' ,to: 'users#new'
  get '/login' ,to: 'sessions#new'
  post '/login' ,to: 'sessions#create'
  delete '/logout',to: 'sessions#destroy'
  resources :users,except: :new
  resources :lessons

  resources :users do
    member do
      get :following,:followers
    end
  end

  namespace :admin do
    resources :categories do 
      resources :words   
    end
  end

  resources :categories do
    resources :answers
  end

  resources :relationships,only:[:create,:destroy]

end
