Rails.application.routes.draw do
  Rails.application.routes.draw do
    post '/graphql', to: 'graphql#execute'
  
    if Rails.env.development?
      # add the url of your end-point to graphql_path.
      mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql" 
    end
  end
end
