defmodule TheScoreWeb.Schema do
  use Absinthe.Schema

  alias TheScoreWeb.PlayersResolver

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
    field :rushing_first_down_percentage_1st, :string
    field :rushing_yards_each_20_plus, :string
    field :rushing_yards_each_40_plus, :string
    field :rushing_fumbles, :string
  end

  query do
    @desc "Get all players"
    field :all_players, non_null(list_of(non_null(:player))) do
      resolve(&PlayersResolver.all_profiles/3)
    end
  end
end
