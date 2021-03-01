defmodule TheScore.Repo.Migrations.AddIndexForPlayerProfileNames do
  use Ecto.Migration

  def change do
    create unique_index(:profiles, [:name])
  end
end
