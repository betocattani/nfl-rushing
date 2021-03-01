defmodule TheScore.PlayersTest do
  use TheScore.DataCase

  alias TheScore.Players

  describe "profiles" do
    alias TheScore.Players.Profile

    @valid_attrs %{longest_rush: "some longest_rush", name: "some name", position: "some position", rushing_attempts: "some rushing_attempts", rushing_attempts_per_game_avg: "some rushing_attempts_per_game_avg", rushing_average_yards_per_attempt: "some rushing_average_yards_per_attempt", rushing_first_down_percentage_first: "some rushing_first_down_percentage_first", rushing_first_downs: "some rushing_first_downs", rushing_fumbles: "some rushing_fumbles", rushing_yards_each_twenty_plus: "some rushing_yards_each_twenty_plus", rushing_yards_each_forty_plus: "some rushing_yards_each_forty_plus", rushing_yards_per_game: "some rushing_yards_per_game", team: "some team", total_rushing_touchdowns: "some total_rushing_touchdowns", total_rushing_yards: "some total_rushing_yards"}
    @update_attrs %{longest_rush: "some updated longest_rush", name: "some updated name", position: "some updated position", rushing_attempts: "some updated rushing_attempts", rushing_attempts_per_game_avg: "some updated rushing_attempts_per_game_avg", rushing_average_yards_per_attempt: "some updated rushing_average_yards_per_attempt", rushing_first_down_percentage_first: "some updated rushing_first_down_percentage_first", rushing_first_downs: "some updated rushing_first_downs", rushing_fumbles: "some updated rushing_fumbles", rushing_yards_each_twenty_plus: "some updated rushing_yards_each_twenty_plus", rushing_yards_each_forty_plus: "some updated rushing_yards_each_forty_plus", rushing_yards_per_game: "some updated rushing_yards_per_game", team: "some updated team", total_rushing_touchdowns: "some updated total_rushing_touchdowns", total_rushing_yards: "some updated total_rushing_yards"}

    def profile_fixture(attrs \\ %{}) do
      {:ok, profile} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Players.create_profile()

      profile
    end

    # test "list_profiles/3 returns all profiles" do
    #   profile = profile_fixture()
    #   assert Players.list_profiles() == [profile]
    # end

    test "get_profile!/1 returns the profile with given id" do
      profile = profile_fixture()
      assert Players.get_profile!(profile.id) == profile
    end

    test "create_profile/1 with valid data creates a profile" do
      assert {:ok, %Profile{} = profile} = Players.create_profile(@valid_attrs)
      assert profile.longest_rush == "some longest_rush"
      assert profile.name == "some name"
      assert profile.position == "some position"
      assert profile.rushing_attempts == "some rushing_attempts"
      assert profile.rushing_attempts_per_game_avg == "some rushing_attempts_per_game_avg"
      assert profile.rushing_average_yards_per_attempt == "some rushing_average_yards_per_attempt"
      assert profile.rushing_first_down_percentage_first == "some rushing_first_down_percentage_first"
      assert profile.rushing_first_downs == "some rushing_first_downs"
      assert profile.rushing_fumbles == "some rushing_fumbles"
      assert profile.rushing_yards_each_twenty_plus == "some rushing_yards_each_twenty_plus"
      assert profile.rushing_yards_each_forty_plus == "some rushing_yards_each_forty_plus"
      assert profile.rushing_yards_per_game == "some rushing_yards_per_game"
      assert profile.team == "some team"
      assert profile.total_rushing_touchdowns == "some total_rushing_touchdowns"
      assert profile.total_rushing_yards == "some total_rushing_yards"
    end

    test "update_profile/2 with valid data updates the profile" do
      profile = profile_fixture()
      assert {:ok, %Profile{} = profile} = Players.update_profile(profile, @update_attrs)
      assert profile.longest_rush == "some updated longest_rush"
      assert profile.name == "some updated name"
      assert profile.position == "some updated position"
      assert profile.rushing_attempts == "some updated rushing_attempts"
      assert profile.rushing_attempts_per_game_avg == "some updated rushing_attempts_per_game_avg"
      assert profile.rushing_average_yards_per_attempt == "some updated rushing_average_yards_per_attempt"
      assert profile.rushing_first_down_percentage_first == "some updated rushing_first_down_percentage_first"
      assert profile.rushing_first_downs == "some updated rushing_first_downs"
      assert profile.rushing_fumbles == "some updated rushing_fumbles"
      assert profile.rushing_yards_each_twenty_plus == "some updated rushing_yards_each_twenty_plus"
      assert profile.rushing_yards_each_forty_plus == "some updated rushing_yards_each_forty_plus"
      assert profile.rushing_yards_per_game == "some updated rushing_yards_per_game"
      assert profile.team == "some updated team"
      assert profile.total_rushing_touchdowns == "some updated total_rushing_touchdowns"
      assert profile.total_rushing_yards == "some updated total_rushing_yards"
    end

    test "delete_profile/1 deletes the profile" do
      profile = profile_fixture()
      assert {:ok, %Profile{}} = Players.delete_profile(profile)
      assert_raise Ecto.NoResultsError, fn -> Players.get_profile!(profile.id) end
    end

    test "change_profile/1 returns a profile changeset" do
      profile = profile_fixture()
      assert %Ecto.Changeset{} = Players.change_profile(profile)
    end
  end
end
