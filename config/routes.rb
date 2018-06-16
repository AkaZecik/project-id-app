Rails.application.routes.draw do
  resources :soundtracks
  resources :records
  resources :radios
  resources :radio_performances
  resources :productions
  resources :production_types
  resources :performances
  resources :people
  resources :members
  resources :member_functions
  resources :genres
  resources :genre_dependencies
  resources :functions
  resources :featuring
  resources :events
  resources :event_performances
  resources :artists
  resources :appearances
  resources :songs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
