Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: "admins/sessions"}
  resources :pages
  root 'weeks#current'
  namespace :api do
    namespace :vi do
      resources :memory_verses
    end
  end
  resources :seasons
  resources :reading_lists
  resources :creative_responses
  resources :memory_verses
  resources :weeks do
    resources :memory_verses
    resources :mealtime_prayers
    resources :creative_responses
    resources :service_ideas
    resources :faith5s
    resources :shares
    resources :talks
    resources :prays
    resources :blesses
    resources :reading_lists do
      :days
    end
    member do
      get :user_view
    end
    member do
      get :mobile_view

    end
    collection do 
      get :current_week
      get :current
    end
    member do
      get :manage_weeks_current
    end
    member do
      post :add_to_queue
    end
    member do
      post :remove_from_queue
    end
    member do
      post :mark_complete
    end
    member do
      post :publish
    end
    collection do
      get :queue
    end
    member do
      get :manage_weeks_queue
    end
    collection do
      get :archives
    end
    member do
      get :manage_weeks_archived
    end
    member do
      get :user_view_archived
      get :user_view_current
      get :user_view_queue
      get :user_view_new
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
