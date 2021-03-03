defmodule TheScore.Players do
  @moduledoc """
  The Players context.
  """

  import Ecto.Query, warn: false

  alias TheScore.Players.Profile
  alias TheScore.Repo

  @doc """
  Returns the list of profiles, able to receive filters

  ## Examples

  iex> list_profiles()
  [%Profile{}, ...]

  iex> list_profiles(order: DESC)
  [%Profile{}, ...]
  """
  def list_profiles(args) do
    args
    |> Enum.reduce(Profile, fn
      {:order, order}, query ->
        query |> order_by({^order, :name})
      {:filter, filter}, query ->
        query |> filter_with(filter)
    end)
    |> Repo.all
  end

  def filter_with(query, filter) do
    Enum.reduce(filter, query, fn
      {:name, name}, query ->
        from q in query, where: ilike(q.name, ^"%#{name}%")
      {:total_rushing_touchdowns, total_rushing_touchdowns}, query ->
        from q in query, where: q.total_rushing_touchdowns == ^total_rushing_touchdowns
      {:total_rushing_yards, total_rushing_yards}, query ->
        from q in query, where: q.total_rushing_yards == ^total_rushing_yards
      {:longest_rush, longest_rush}, query ->
        from q in query, where: q.longest_rush == ^longest_rush
    end)
  end

  @doc """
  Gets a single profile.

  Raises `Ecto.NoResultsError` if the Profile does not exist.

  ## Examples

      iex> get_profile!(123)
      %Profile{}

      iex> get_profile!(456)
      ** (Ecto.NoResultsError)

  """
  def get_profile!(id), do: Repo.get!(Profile, id)

  @doc """
  Creates a profile.

  ## Examples

      iex> create_profile(%{field: value})
      {:ok, %Profile{}}

      iex> create_profile(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_profile(attrs \\ %{}) do
    %Profile{}
    |> Profile.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a profile.

  ## Examples

      iex> update_profile(profile, %{field: new_value})
      {:ok, %Profile{}}

      iex> update_profile(profile, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_profile(%Profile{} = profile, attrs) do
    profile
    |> Profile.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a profile.

  ## Examples

      iex> delete_profile(profile)
      {:ok, %Profile{}}

      iex> delete_profile(profile)
      {:error, %Ecto.Changeset{}}

  """
  def delete_profile(%Profile{} = profile) do
    Repo.delete(profile)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking profile changes.

  ## Examples

      iex> change_profile(profile)
      %Ecto.Changeset{data: %Profile{}}

  """
  def change_profile(%Profile{} = profile, attrs \\ %{}) do
    Profile.changeset(profile, attrs)
  end
end
