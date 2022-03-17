defmodule FibonacciApiWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use FibonacciApiWeb, :controller

  # This clause will handle invalid resource data.
  def call(conn, {:error, %Ecto.Changeset{}}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(FibonacciApiWeb.ErrorView)
    |> render(:"422")
  end
end
