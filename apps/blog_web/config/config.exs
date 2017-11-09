# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :blog_web,
  ecto_repos: [Blog.Repo],
  generators: [context_app: :blog]

# Configures the endpoint
config :blog_web, BlogWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "708gRpE8BIQvOj9L4HhEeC1yRx3WLY//FRcc5W8mG2w=",
  render_errors: [view: BlogWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BlogWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
