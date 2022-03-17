defmodule FibonacciApi.Items.Number do
  use Ecto.Schema
  import Ecto.Changeset

  schema "numbers" do
    field :blacklisted, :boolean, default: false
    field :description, :string
    field :value, :integer

    timestamps()
  end

  @doc false
  def changeset(number, attrs) do
    number
    |> cast(attrs, [:value, :description, :blacklisted])
    |> validate_required([:value, :description, :blacklisted])
  end
end
