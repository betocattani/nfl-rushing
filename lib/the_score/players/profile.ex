defmodule TheScore.Players.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "profiles" do
    field :longest_rush, :string
    field :name, :string
    field :position, :string
    field :rushing_attempts, :string
    field :rushing_attempts_per_game_avg, :string
    field :rushing_average_yards_per_attempt, :string
    field :rushing_first_down_percentage_first, :string
    field :rushing_first_downs, :string
    field :rushing_fumbles, :string
    field :rushing_yards_each_twenty_plus, :string
    field :rushing_yards_each_forty_plus, :string
    field :rushing_yards_per_game, :string
    field :team, :string
    field :total_rushing_touchdowns, :string
    field :total_rushing_yards, :string

    timestamps()
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:name, :team, :position, :rushing_attempts_per_game_avg, :rushing_attempts, :total_rushing_yards, :rushing_average_yards_per_attempt, :rushing_yards_per_game, :total_rushing_touchdowns, :longest_rush, :rushing_first_downs, :rushing_first_down_percentage_first, :rushing_yards_each_twenty_plus, :rushing_yards_each_forty_plus, :rushing_fumbles])
    |> validate_required([])
  end
end
