defmodule ChallengeMylads.Repo do
  use Ecto.Repo,
    otp_app: :challenge_mylads,
    adapter: Ecto.Adapters.Postgres
end
