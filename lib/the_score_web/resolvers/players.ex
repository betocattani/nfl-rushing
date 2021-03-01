defmodule TheScoreWeb.Resolvers.Players do
  alias TheScore.Players

  def all_profiles(_root, args, _info) do
    {:ok, Players.list_profiles(args)}
  end

  def create_profile(_, %{input: params}, _) do
    case Players.create_profile(params) do
      {:error, _} ->
        {:error, "Could not be possible to create the player profile"}
      {:ok, _} = success ->
        success
    end
  end
end
