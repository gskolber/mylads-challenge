defmodule ChallengeMylads.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      # Start the Ecto repository
      ChallengeMylads.Repo,
      # Start the Telemetry supervisor
      ChallengeMyladsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ChallengeMylads.PubSub},
      # Start the Endpoint (http/https)
      ChallengeMyladsWeb.Endpoint,
      worker(Mongo, [[name: :database, url: database(), pool_size: 2]]),
      # Start a worker by calling: ChallengeMylads.Worker.start_link(arg)
      # {ChallengeMylads.Worker, arg}
      {Oban, oban_config()}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ChallengeMylads.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ChallengeMyladsWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp oban_config do
    Application.fetch_env!(:challenge_mylads, Oban)
  end

  defp database,
    do:
      Application.get_env(
        :challenge_mylads,
        :url,
        "mongodb+srv://teste:teste@cluster0.z3lgv.mongodb.net/mylads_challenge"
      )
end
