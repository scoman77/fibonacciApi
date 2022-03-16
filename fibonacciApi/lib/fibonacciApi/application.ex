defmodule FibonacciApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      FibonacciApi.Repo,
      # Start the Telemetry supervisor
      FibonacciApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: FibonacciApi.PubSub},
      # Start the Endpoint (http/https)
      FibonacciApiWeb.Endpoint
      # Start a worker by calling: FibonacciApi.Worker.start_link(arg)
      # {FibonacciApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FibonacciApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FibonacciApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
