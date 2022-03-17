defmodule HelloPhoenix.Repo.Migrations.CreateNumbers do
  use Ecto.Migration

  def change do
    create table(:numbers) do
      add :value, :integer
      add :blacklisted, :boolean

      timestamps
    end
  end
end