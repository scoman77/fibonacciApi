defmodule FibonacciApi.Items.Number do
  use Ecto.Schema
  import Ecto.Changeset

  schema "numbers" do
    field :value, :integer
    field :blacklisted, :boolean, default: false
    timestamps()
  end

  @doc false
  def changeset(number, attrs) do
    number
    |> cast(attrs, [:value, :blacklisted])
    |> validate_required([:value, :blacklisted])
  end
end
