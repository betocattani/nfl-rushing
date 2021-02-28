defmodule TheScoreWeb.PlayersResolver do
  alias TheScore.Players

  def all_profiles(_root, _args, _info) do
    {:ok, Players.list_profiles()}
  end

  def create_profile(_root, args, _info) do
    case Players.create_profile(args) do
      {:ok, profile} ->
        {:ok, profile}
      {:error, errors} ->
        {:error, errors}
    end
  end
end
