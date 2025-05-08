# Rails.application.routes.draw do
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
#   # Can be used by load balancers and uptime monitors to verify that the app is live.
#   # get "up" => "rails/health#show", as: :rails_health_check

#   # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
#   # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
#   # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

#   # Defines the root path route ("/")
#   # root "posts#index"
#   root "places#index"

#   get "/api/places", to: "api/places#index"
  
# end

Rails.application.routes.draw do
  root "places#index"

  namespace :api do
    resources :places, only: [:index]
  end
end
# This code defines the routes for a Ruby on Rails application. It sets the root path to the index action of the PlacesController and defines an API namespace for places with only the index action available. The routes are defined using the Rails routing DSL, which allows for easy mapping of URLs to controller actions.
# The root path is the default URL that users will see when they visit the application, and it is set to the index action of the PlacesController. This means that when users visit the root URL, they will be directed to the index action of the PlacesController, which is responsible for displaying a list of places.
# The API namespace is defined using the `namespace` method, which creates a new scope for the routes. This allows for better organization of the routes and makes it clear that these routes are intended for API use. The `resources` method is used to define a RESTful resource for places, but only the index action is available in this case. This means that users can only access the list of places through the API.
# Overall, this code provides a simple and organized way to define the routes for a Ruby on Rails application, making it easy to manage and maintain.


