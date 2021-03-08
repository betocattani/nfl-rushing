defmodule TheScore.PlayersTest do
  use TheScore.DataCase

  alias TheScore.Players

  describe "profiles" do
    alias TheScore.Players.Profile

    @valid_attrs %{
      longest_rush: "some longest_rush",
      name: "some name",
      position: "some position",
      rushing_attempts: "some rushing_attempts",
      rushing_attempts_per_game_avg: 3.0,
      rushing_average_yards_per_attempt: 1.4,
      rushing_first_down_percentage_first: 4.7,
      rushing_first_downs: 1,
      rushing_fumbles: 0,
      rushing_yards_each_twenty_plus: 0,
      rushing_yards_each_forty_plus: 0,
      rushing_yards_per_game: 8.4,
      team: "some team",
      total_rushing_touchdowns: 2,
      total_rushing_yards: "some total_rushing_yards"
    }
    @update_attrs %{
      longest_rush: "some updated longest_rush",
      name: "some updated name",
      position: "some updated position",
      rushing_attempts: "some updated rushing_attempts",
      rushing_attempts_per_game_avg: 4.0,
      rushing_average_yards_per_attempt: 1.6,
      rushing_first_down_percentage_first: 5.7,
      rushing_first_downs: 2,
      rushing_fumbles: nil,
      rushing_yards_each_twenty_plus: nil,
      rushing_yards_each_forty_plus: nil,
      rushing_yards_per_game: 9.2,
      team: "some updated team",
      total_rushing_touchdowns: 1,
      total_rushing_yards: "some updated total_rushing_yards"
    }

    def profile_fixture(attrs \\ %{}) do
      {:ok, profile} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Players.create_profile()

      profile
    end

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
      assert profile.rushing_attempts_per_game_avg == 3.0
      assert profile.rushing_average_yards_per_attempt == 1.4
      assert profile.rushing_first_down_percentage_first == 4.7
      assert profile.rushing_first_downs == 1
      assert profile.rushing_fumbles == 0
      assert profile.rushing_yards_each_twenty_plus == 0
      assert profile.rushing_yards_each_forty_plus == 0
      assert profile.rushing_yards_per_game == 8.4
      assert profile.team == "some team"
      assert profile.total_rushing_touchdowns == 2
      assert profile.total_rushing_yards == "some total_rushing_yards"
    end

    test "update_profile/2 with valid data updates the profile" do
      profile = profile_fixture()
      assert {:ok, %Profile{} = profile} = Players.update_profile(profile, @update_attrs)
      assert profile.longest_rush == "some updated longest_rush"
      assert profile.name == "some updated name"
      assert profile.position == "some updated position"
      assert profile.rushing_attempts == "some updated rushing_attempts"
      assert profile.rushing_attempts_per_game_avg == 4.0
      assert profile.rushing_average_yards_per_attempt == 1.6
      assert profile.rushing_first_down_percentage_first == 5.7
      assert profile.rushing_first_downs == 2
      assert profile.rushing_fumbles == nil
      assert profile.rushing_yards_each_twenty_plus == nil
      assert profile.rushing_yards_each_forty_plus == nil
      assert profile.rushing_yards_per_game == 9.2
      assert profile.team == "some updated team"
      assert profile.total_rushing_touchdowns == 1
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
