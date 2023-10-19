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
end
