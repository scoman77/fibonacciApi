defmodule FibonacciApiWeb.PageController do
  use FibonacciApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
