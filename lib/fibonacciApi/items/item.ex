defmodule fibonacciApi.Items.Item do

  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :value, :int
    field :description, :string
    field :shown, :boolean, default: false

    timestamps()
  end

  def changeset(item, params) do
    item
    |> cast(params, [:value,:description, :shown])
  end
end