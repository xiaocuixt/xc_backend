Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  resources :posts
  namespace :api do
    resource :excutes, only: :index, via: [:post, :options]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/api/excutes"
  end
end
