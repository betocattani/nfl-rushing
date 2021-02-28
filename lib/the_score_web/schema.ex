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
    field :rushing_first_down_percentage_first, :string
    field :rushing_yards_each_twenty_plus, :string
    field :rushing_yards_each_forty_plus, :string
    field :rushing_fumbles, :string
  end

  query do
    @desc "Get all players"
    field :all_players, non_null(list_of(non_null(:player))) do
      resolve(&PlayersResolver.all_profiles/3)
    end
  end

  mutation do
    @desc "Create a new Player Profile"
    field :create_profile, :player do
      arg :name, :string
      arg :team, :string
      arg :position, :string
      arg :rushing_attempts_per_game_avg, :string
      arg :rushing_attempts, :string
      arg :total_rushing_yards, :string
      arg :rushing_average_yards_per_attempt, :string
      arg :rushing_yards_per_game, :string
      arg :total_rushing_touchdowns, :string
      arg :longest_rush, :string
      arg :rushing_first_downs, :string
      arg :rushing_first_down_percentage_first, :string
      arg :rushing_yards_each_twenty_plus, :string
      arg :rushing_yards_each_forty_plus, :string
      arg :rushing_fumbles, :string

      resolve(&PlayersResolver.create_profile/3)
    end
  end
end