defmodule FibonacciApi.ItemsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FibonacciApi.Items` context.
  """

  @doc """
  Generate a number.
  """
  def number_fixture(attrs \\ %{}) do
    {:ok, number} =
      attrs
      |> Enum.into(%{
        extra: "some extra",
        shown: true,
        value: 42
      })
      |> FibonacciApi.Items.create_number()

    number
  end
end
