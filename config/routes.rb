Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  namespace :api do
    #API ROUTES SHOULD GO HERE
  end

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  #Do not place any routes below this one
  if Rails.env.production?
    get '*other', to: 'static#index'
  end
end
