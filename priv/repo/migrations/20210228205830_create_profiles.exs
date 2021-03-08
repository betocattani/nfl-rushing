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
      add :total_rushing_touchdowns, :integer
      add :longest_rush, :string
      add :rushing_first_downs, :integer
      add :rushing_first_down_percentage_first, :string
      add :rushing_yards_each_twenty_plus, :integer
      add :rushing_yards_each_forty_plus, :integer
      add :rushing_fumbles, :integer

      timestamps()
    end

  end
end
