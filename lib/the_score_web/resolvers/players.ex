defmodule TheScoreWeb.Resolvers.Players do
  alias TheScore.Players

  def all_profiles(_root, args, _info) do
    {:ok, Players.list_profiles(args)}
  end

  def create_profile(_, %{input: params}, _) do
    case Players.create_profile(params) do
      {:error, changeset} ->
        {:ok, %{errors: transform_errors(changeset)}}
      {:ok, player_profile} ->
        {:ok, %{player_profile: player_profile}}
    end
  end

  defp transform_errors(changeset) do
    changeset
    |> Ecto.Changeset.traverse_errors(&format_error/1)
    |> Enum.map(fn
      {key, value} ->
        %{key: key, message: value}
    end)
  end

  @spec format_error(Ecto.Changeset.error) :: String.t
  defp format_error({msg, opts}) do
    Enum.reduce(opts, msg, fn {key, value}, acc ->
      String.replace(acc, "%{#{key}}", to_string(value))
    end)
  end

  def error_details(changeset) do
    changeset
    |> Ecto.Changeset.traverse_errors(fn {msg, _} -> msg end)
  end
end
