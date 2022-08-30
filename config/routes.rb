Rails.application.routes.draw do
  resources :posts
  devise_for :users,
    controllers: {
      registrations: "users/registrations",
    }
  root "welcome#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
