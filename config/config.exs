# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :rdapi,
  ecto_repos: [Rdapi.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :rdapi, RdapiWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [json: RdapiWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Rdapi.PubSub,
  live_view: [signing_salt: "4olHIy0l"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :rdapi, RdapiWeb.Auth.Guardian,
  issuer: "rdapi",
  secret_key: "YSvIkScgBNHOIz3H5jLOBvj4O9HogguDtSJvg+mcjgtzyPCRrDWoaSc/nfOisqX5"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
