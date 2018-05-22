Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :locations, only: [:index, :show]
  # display locations get ""

  namespace :users do
    resources :locations, except: [:show]

    get "/locations/:id/booking", to: "availabilities#book", as: "book"
    post "/locations/:id/booking/create", to: "availabilities#create"

    get "/bookings/", to: "availabilities#display", as: "my_bookings"
    delete "/bookings/:id", to: "availabilities#destroy", as: "destroy_booking"

  end
end
