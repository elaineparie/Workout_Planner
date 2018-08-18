Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'static_pages#home'
resources :members
resources :exercises
resources :workouts
resources :routines
 get "/login", to: "sessions#new"
end
