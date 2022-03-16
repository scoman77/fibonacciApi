defmodule FibonacciApi.Repo.Migrations.CreateNumbers do
  use Ecto.Migration

  def change do
    create table(:numbers) do
      add :value, :integer
      add :extra, :string
      add :shown, :boolean, default: false, null: false

      timestamps()
    end
  end
end
