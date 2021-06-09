defmodule TheScoreWeb.Resolvers.Players do
  alias TheScore.Players

  def all_profiles(_root, args, _info) do
    {:ok, Players.list_profiles(args)}
  end

  def create_profile(_, %{input: params}, _) do
    with {:ok, profile} <- Players.create_profile(params) do
      {:ok, %{player_profile: profile}}
    end
  end

  def show_profile(_, %{input: params}, _) do
    with {:ok, profile} <- Players.get_profile!(params["id"]) do
      {:ok, %{player_profile: profile}}
    end
  end
end
