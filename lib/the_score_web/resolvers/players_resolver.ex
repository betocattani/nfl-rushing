defmodule TheScoreWeb.PlayersResolver do
  alias TheScore.Players

  def all_profiles(_root, _args, _info) do
    {:ok, Players.list_profiles()}
  end
end
