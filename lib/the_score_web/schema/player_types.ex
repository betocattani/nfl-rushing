defmodule TheScoreWeb.Schema.PlayerTypes do
  use Absinthe.Schema.Notation

  object :player do
    field :name, :string
    field :team, :string
    field :position, :string
    field :rushing_attempts_per_game_avg, :string
    field :rushing_attempts, :string
    field :total_rushing_yards, :string
    field :rushing_average_yards_per_attempt, :string
    field :rushing_yards_per_game, :string
    field :total_rushing_touchdowns, :string
    field :longest_rush, :string
    field :rushing_first_downs, :string
    field :rushing_first_down_percentage_first, :string
    field :rushing_yards_each_twenty_plus, :string
    field :rushing_yards_each_forty_plus, :string
    field :rushing_fumbles, :string
  end

  @desc "Filtering options for the players profile list"
  input_object :player_profile_filter do

    @desc "Matching a name"
    field :name, :string

    @desc "Matching by total_rushing_touchdowns"
    field :total_rushing_touchdowns, :string

    @desc "Matching by total_rushing_yards"
    field :total_rushing_yards, :string

    @desc "Matching by longest_rush"
    field :longest_rush, :string
  end
end
