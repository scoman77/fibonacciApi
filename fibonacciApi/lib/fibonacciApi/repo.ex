defmodule FibonacciApi.Repo do
  use Ecto.Repo,
    otp_app: :fibonacciApi,
    adapter: Ecto.Adapters.Postgres
end
