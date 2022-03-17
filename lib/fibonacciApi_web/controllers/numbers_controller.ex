defmodule FibonacciApiWeb.NumbersController do
  use FibonacciApiWeb, :controller

  alias FibonacciApi.Items
  alias FibonacciApi.Items.Number
  alias FibonacciApi.NumbersGenerator

  action_fallback FibonacciApiWeb.FallbackController

  def index(conn, _params) do
    numbers = NumbersGenerator.fibonacci_do(200)
    numbers
  end

  def create(conn, %{"number" => number_params}) do
    with {:ok, %Number{} = number} <- Items.create_number(number_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.number_path(conn, :show, number))
      |> render("show.json", number: number)
    end
  end

  def show( %{"id" => id}) do
    number = NumbersGenerator.fibonacci(id)
    render(number)
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
