Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :locations, only: [:index, :show]
  # display locations get ""

  namespace :users do
    resources :locations, except: [:show]

    patch '/locations/availabilities/:id/accept', to: 'availabilities#accept', as: :accept_availability
    patch '/locations/availabilities/:id/decline', to: 'availabilities#decline', as: :decline_availability

    get "/locations/:id/new_availability", to: "availabilities#new_availability", as: "new_availability"
    post "/locations/:id/create_availability", to: "availabilities#create_availability", as: "create_availability"

    delete "/locations/:availability_id/delete_availability", to: "availabilities#destroy_availability", as: "destroy_availability"

    get "/locations/:id/booking", to: "availabilities#book", as: "book"
    post "/locations/:id/booking/create", to: "availabilities#create_booking", as: "create_booking"

    get "/bookings/", to: "availabilities#display", as: "my_bookings"
    patch "/bookings/:id", to: "availabilities#delete_user_from_booking", as: "delete_from_booking"

  end
end
