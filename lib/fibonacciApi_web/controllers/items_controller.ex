defmodule fibonacciApi.ItemsController do
  use fibonacciApi, :controller

  alias fibonacciApi.Items

  def index(conn, _params) do
    items = Items.list_items()
    render(conn, "index.html", items: items)
  end
end