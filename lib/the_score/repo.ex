defmodule TheScore.Repo do
  use Ecto.Repo,
    otp_app: :the_score,
    adapter: Ecto.Adapters.Postgres
end
