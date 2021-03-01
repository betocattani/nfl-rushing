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
    field :create_player_profile, :player do
      arg :input, non_null(:player_profile_input)
      resolve &Resolvers.Players.create_profile/3
    end
  end
end
