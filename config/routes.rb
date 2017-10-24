Rails.application.routes.draw do
  root 'weeks#index'
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
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
