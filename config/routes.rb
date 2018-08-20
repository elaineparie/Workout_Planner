Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'static_pages#home'
resources :members
resources :exercises
resources :workouts
resources :routines
 get "/login", to: "sessions#new"
 post "/sessions/create", to: "sessions#create"
 get "/all_routines", to: "routines#all_routines"
 get '/auth/facebook/callback' => 'sessions#create'
 get '/privatepolicyfb' => 'static_pages#privatepolicyfb'
end
