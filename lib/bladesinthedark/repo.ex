defmodule BladesInTheDark.Repo do
  use Ecto.Repo,
    otp_app: :bladesinthedark,
    adapter: Ecto.Adapters.Postgres
end
