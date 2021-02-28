defmodule TheScore.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def change do
    create table(:profiles) do
      add :name, :string
      add :team, :string
      add :position, :string
      add :rushing_attempts_per_game_avg, :string
      add :rushing_attempts, :string
      add :total_rushing_yards, :string
      add :rushing_average_yards_per_attempt, :string
      add :rushing_yards_per_game, :string
      add :total_rushing_touchdowns, :string
      add :longest_rush, :string
      add :rushing_first_downs, :string
      add :rushing_first_down_percentage_first, :string
      add :rushing_yards_each_twenty_plus, :string
      add :rushing_yards_each_forty_plus, :string
      add :rushing_fumbles, :string

      timestamps()
    end

  end
end
