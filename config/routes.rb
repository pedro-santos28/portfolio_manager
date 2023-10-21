Rails.application.routes.draw do
  resources :abouts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "abouts#index"

  get "/projects", to: "projects#index"
  get "/projects/:id", to: "projects#show", as: "show_project"
  get '/projects/edit/:id', to: 'projects#edit', as: "edit_project"
  put "/projects/update/:id", to: "projects#update", as: "update_project"
  patch "/projects/update/:id", to: "projects#update"

  get "profile", to: "profile#index"
  get "profile/edit/:id", to: "profile#edit", as: "edit_profile"
  put "profile/update/:id", to: "profile#update", as: "update_profile"
  patch "profile/update/:id", to: "profile#update"
end
