defmodule TheScoreWeb.Resolvers.Players do
  alias TheScore.Players

  def all_profiles(_root, args, _info) do
    {:ok, Players.list_profiles(args)}
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
