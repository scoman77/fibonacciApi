defmodule FibonacciApi.Items.Number do
  use Ecto.Schema
  import Ecto.Changeset

  schema "numbers" do
    field :extra, :string
    field :shown, :boolean, default: false
    field :value, :integer

    timestamps()
  end

  @doc false
  def changeset(number, attrs) do
    number
    |> cast(attrs, [:value, :extra, :shown])
    |> validate_required([:value, :extra, :shown])
  end
end
