# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

read_config = fn config_file ->
  File.read!("config/text/#{config_file}.txt") |> String.split("\n", trim: true)
end

config :bladesinthedark,
  ecto_repos: [BladesInTheDark.Repo]

# Configures the endpoint
config :bladesinthedark, BladesInTheDarkWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TqUtftRm6X/L17eBakern9TuqK85/Xm8CIpbD1+E0rT7q/+BzIyJLgVrrNds1m6c",
  render_errors: [view: BladesInTheDarkWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: BladesInTheDark.PubSub,
  live_view: [signing_salt: "1sQ4bqTG"]

config :bladesinthedark, BladesInTheDark.People,
  names: read_config.("people_names"),
  family_names: read_config.("people_family_names"),
  goals: read_config.("people_goals"),
  physique: read_config.("people_physique"),
  gender: read_config.("people_gender"),
  preferred_methods: read_config.("people_preferred_methods"),
  heritage: read_config.("people_heritage"),
  common_profession: read_config.("people_common_profession"),
  rare_profession: read_config.("people_rare_profession"),
  traits: read_config.("people_traits"),
  interests: read_config.("people_interests"),
  quirks: read_config.("people_quirks")

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
