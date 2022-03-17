defmodule FibonacciApi.Repo.Migrations.CreateNumbers do
  use Ecto.Migration

  def change do
    create table(:numbers) do
      add :value, :integer
      add :description, :text
      add :blacklisted, :boolean, default: false, null: false

      timestamps()
    end
  end
end
