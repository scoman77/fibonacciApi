defmodule FibonacciApiWeb.NumbersController do
  use FibonacciApiWeb, :controller

  alias FibonacciApi.Items
  alias FibonacciApi.Items.Number

  def index(conn, _params) do
    numbers = Items.list_numbers()
    render(conn, "index.html", numbers: numbers)
  end

  def new(conn, _params) do
    changeset = Items.change_number(%Number{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"number" => number_params}) do
    case Items.create_number(number_params) do
      {:ok, number} ->
        conn
        |> put_flash(:info, "Number created successfully.")
        |> redirect(to: Routes.number_path(conn, :show, number))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    number = Items.get_number!(id)
    render(conn, "show.html", number: number)
  end

  def edit(conn, %{"id" => id}) do
    number = Items.get_number!(id)
    changeset = Items.change_number(number)
    render(conn, "edit.html", number: number, changeset: changeset)
  end

  def update(conn, %{"id" => id, "number" => number_params}) do
    number = Items.get_number!(id)

    case Items.update_number(number, number_params) do
      {:ok, number} ->
        conn
        |> put_flash(:info, "Number updated successfully.")
        |> redirect(to: Routes.number_path(conn, :show, number))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", number: number, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    number = Items.get_number!(id)
    {:ok, _number} = Items.delete_number(number)

    conn
    |> put_flash(:info, "Number deleted successfully.")
    |> redirect(to: Routes.number_path(conn, :index))
  end
end
