defmodule TheScoreWeb.Resolvers.Players do
  alias TheScore.Players

  def all_profiles(_root, args, _info) do
    {:ok, Players.list_profiles(args)}
  end

  def create_profile(_, %{input: params}, _) do
    case Players.create_profile(params) do
      {:error, changeset} ->
        {
          :error,
          message: "Could not create player profile",
          details: error_details(changeset)
        }
      success -> success
    end
  end

  def error_details(changeset) do
    changeset
    |> Ecto.Changeset.traverse_errors(fn {msg, _} -> msg end)
  end
end
