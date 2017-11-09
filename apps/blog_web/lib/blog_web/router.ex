defmodule BlogWeb.Router do
  use BlogWeb, :router

  forward "/api", Absinthe.Plug, schema: BlogAPI.Schema
  

  if Mix.env == :dev do
    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: BlogAPI.Schema
  end
end
