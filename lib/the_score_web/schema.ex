defmodule TheScoreWeb.Schema do
  use Absinthe.Schema

  alias TheScoreWeb.Resolvers

  import_types __MODULE__.PlayerTypes

  query do
    @desc "Get all players"
    import_fields :players_queries
  end

  enum :sort_players do
    value :asc
    value :desc
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

      resolve &Resolvers.Players.create_profile/3
    end
  end
end
