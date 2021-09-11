# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :bladesinthedark,
  ecto_repos: [Bladesinthedark.Repo]

# Configures the endpoint
config :bladesinthedark, BladesinthedarkWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TqUtftRm6X/L17eBakern9TuqK85/Xm8CIpbD1+E0rT7q/+BzIyJLgVrrNds1m6c",
  render_errors: [view: BladesinthedarkWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Bladesinthedark.PubSub,
  live_view: [signing_salt: "1sQ4bqTG"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
