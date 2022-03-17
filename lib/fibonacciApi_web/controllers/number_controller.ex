defmodule FibonacciApiWeb.NumberController do
  use FibonacciApiWeb, :controller

  alias FibonacciApi.Items.Number
  alias FibonacciApi.NumbersGenerator

  def index(conn, _params) do
    numbers = Repo.all(Numbers)
    render(conn, "index.json", numbers: numbers)
  end
end
