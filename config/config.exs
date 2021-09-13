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

config :bladesinthedark, BladesInTheDark.NPC,
  names: read_config.("npc_names"),
  family_names: read_config.("npc_family_names"),
  goals: read_config.("npc_goals"),
  physique: read_config.("npc_physique"),
  gender: read_config.("npc_gender"),
  preferred_methods: read_config.("npc_preferred_methods"),
  heritage: read_config.("npc_heritage"),
  common_profession: read_config.("npc_common_profession"),
  rare_profession: read_config.("npc_rare_profession"),
  traits: read_config.("npc_traits"),
  interests: read_config.("npc_interests"),
  quirks: read_config.("npc_quirks"),
  styles: read_config.("npc_styles"),
  nicknames: read_config.("npc_nicknames")

config :bladesinthedark, BladesInTheDark.Scores,
  work: read_config.("scores_work")

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
