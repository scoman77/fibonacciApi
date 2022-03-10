defmodule FibonacciApi.Repo.Migrations.AddItems do
  use Ecto.Migration

  def change do
    create table (:items) do
      	add :value, :int		
      	add :description, :string
      	add :shown, :boolean
      	timestamps()
	end
    end
end
