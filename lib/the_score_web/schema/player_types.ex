defmodule TheScoreWeb.Schema.PlayerTypes do
  use Absinthe.Schema.Notation

  alias TheScoreWeb.Resolvers

  object :player do
    field :id, :string
    field :name, :string
    field :team, :string
    field :position, :string
    field :rushing_attempts_per_game_avg, :float
    field :rushing_attempts, :string
    field :total_rushing_yards, :string
    field :rushing_average_yards_per_attempt, :float
    field :rushing_yards_per_game, :float
    field :total_rushing_touchdowns, :string
    field :longest_rush, :string
    field :rushing_first_downs, :string
    field :rushing_first_down_percentage_first, :float
    field :rushing_yards_each_twenty_plus, :integer
    field :rushing_yards_each_forty_plus, :integer
    field :rushing_fumbles, :integer
  end

  object :players_queries do
    field :players, list_of(:player) do
      arg :filter, :player_profile_filter
      arg :order, type: :sort_players, default_value: :asc
      resolve &Resolvers.Players.all_profiles/3
    end
  end

  object :find_player do
    field :player, :player do
      arg :id, :integer
      resolve &Resolvers.Players.show_profile/3
    end
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

  input_object :player_profile_input do
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
    field :rushing_yards_each_twenty_plus, :integer
    field :rushing_yards_each_forty_plus, :integer
    field :rushing_fumbles, :integer
  end

  object :player_profile_result do
    field :player_profile, :player
    field :errors, list_of(:input_error)
  end
end
