defmodule SoundLift.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SoundLiftWeb.Telemetry,
      # Start the Ecto repository
      SoundLift.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: SoundLift.PubSub},
      # Start Finch
      {Finch, name: SoundLift.Finch},
      # Start the Endpoint (http/https)
      SoundLiftWeb.Endpoint
      # Start a worker by calling: SoundLift.Worker.start_link(arg)
      # {SoundLift.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SoundLift.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SoundLiftWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
