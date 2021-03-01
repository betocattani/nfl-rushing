defmodule TheScoreWeb.Schema do
  use Absinthe.Schema

  alias TheScoreWeb.Resolvers
  alias TheScoreWeb.Schema.Middleware

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
    field :create_player_profile, :player_profile_result do
      arg :input, non_null(:player_profile_input)
      resolve &Resolvers.Players.create_profile/3
      middleware Middleware.ChangesetErrors
    end
  end

  @desc "An error encountered trying to persist input"
  object :input_error do
    field :key, non_null(:string)
    field :message, non_null(:string)
  end
end
