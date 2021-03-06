defmodule TheScore.Players.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "profiles" do
    field :longest_rush, :string
    field :name, :string
    field :position, :string
    field :rushing_attempts, :string
    field :rushing_attempts_per_game_avg, :float
    field :rushing_average_yards_per_attempt, :float
    field :rushing_first_down_percentage_first, :float
    field :rushing_first_downs, :integer
    field :rushing_fumbles, :integer
    field :rushing_yards_each_twenty_plus, :integer
    field :rushing_yards_each_forty_plus, :integer
    field :rushing_yards_per_game, :float
    field :team, :string
    field :total_rushing_touchdowns, :integer
    field :total_rushing_yards, :string

    timestamps()
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [
        :name,
        :team,
        :position,
        :rushing_attempts_per_game_avg,
        :rushing_attempts,
        :total_rushing_yards,
        :rushing_average_yards_per_attempt,
        :rushing_yards_per_game,
        :total_rushing_touchdowns,
        :longest_rush,
        :rushing_first_downs,
        :rushing_first_down_percentage_first,
        :rushing_yards_each_twenty_plus,
        :rushing_yards_each_forty_plus,
        :rushing_fumbles]
      )
    |> validate_required([:name, :team, :position])
    |> unique_constraint(:name)
  end
end
