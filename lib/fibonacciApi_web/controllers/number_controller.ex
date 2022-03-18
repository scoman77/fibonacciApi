defmodule FibonacciApiWeb.NumberController do
  use FibonacciApiWeb, :controller

  alias FibonacciApi.Items
  alias FibonacciApi.Items.Number
  alias FibonacciApi.NumberGenerator

  action_fallback FibonacciApiWeb.FallbackController

  def index(conn, _params) do
    numbers = Items.list_numbers()
    render(conn, "index.json", numbers: numbers)
  end

  def create(conn, %{"number" => number_params}) do
    with {:ok, %Number{} = number} <- Items.create_number(number_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.number_path(conn, :show, number))
      |> render("show.json", number: number)
    end
  end

  def show(conn, %{"id" => id}) do
    number = Items.get_number!(id)
    render(conn, "show.json", number: number)
    ##number = NumberGenerator.compute(Integer.parse(id))
    ##number
  end

  def update(conn, %{"id" => id, "number" => number_params}) do
    number = Items.get_number!(id)

    with {:ok, %Number{} = number} <- Items.update_number(number, number_params) do
      render(conn, "show.json", number: number)
    end
  end

  def delete(conn, %{"id" => id}) do
    number = Items.get_number!(id)

    with {:ok, %Number{}} <- Items.delete_number(number) do
      send_resp(conn, :no_content, "")
    end
  end
end
