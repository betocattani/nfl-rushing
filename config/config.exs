# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :the_score,
  ecto_repos: [TheScore.Repo]

# Configures the endpoint
config :the_score, TheScoreWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "LObI8SH8AV92TjgxLmGpyMFDpm2UsV4onajdO807MCC05Y/EMUDY2OXZ4WGf4yC7",
  render_errors: [view: TheScoreWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: TheScore.PubSub,
  live_view: [signing_salt: "e1zDbbFN"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
