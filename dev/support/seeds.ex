defmodule TheScore.Seeds do

  alias TheScore.{Players.Profile, Repo}
  def run() do
    %Profile{
      name: "Joe Banyard",
      team: "JAX",
      position: "RB",
      rushing_attempts_per_game_avg: "2",
      rushing_attempts: "2",
      total_rushing_yards: "7",
      rushing_average_yards_per_attempt: "3.5",
      rushing_yards_per_game: "7",
      total_rushing_touchdowns: "0",
      longest_rush: "7",
      rushing_first_downs: "0",
      rushing_first_down_percentage_first: "0",
      rushing_yards_each_twenty_plus: "0",
      rushing_yards_each_forty_plus: "0",
      rushing_fumbles: "0"
    } |> Repo.insert!

    %Profile{
      name: "Johnny Holton",
      team: "OAK",
      position: "WR",
      rushing_attempts_per_game_avg: "6",
      rushing_attempts: "0.4",
      total_rushing_yards: "43",
      rushing_average_yards_per_attempt: "7.2",
      rushing_yards_per_game: "2.9",
      total_rushing_touchdowns: "0",
      longest_rush: "29",
      rushing_first_downs: "2",
      rushing_first_down_percentage_first: "33.3",
      rushing_yards_each_twenty_plus: "1",
      rushing_yards_each_forty_plus: "0",
      rushing_fumbles: "1"
    } |> Repo.insert!

    %Profile{
      name: "Tommylee Lewis",
      team: "NO",
      position: "WR",
      rushing_attempts_per_game_avg: "3",
      rushing_attempts: "0.2",
      total_rushing_yards: "11",
      rushing_average_yards_per_attempt: "3.7",
      rushing_yards_per_game: "0.9",
      total_rushing_touchdowns: "0",
      longest_rush: "7",
      rushing_first_downs: "1",
      rushing_first_down_percentage_first: "33.3",
      rushing_yards_each_twenty_plus: "0",
      rushing_yards_each_forty_plus: "0",
      rushing_fumbles: "0"
    } |> Repo.insert!

    %Profile{
      name: "Marc Mariani",
      team: "TEN",
      position: "WR",
      rushing_attempts_per_game_avg: "1",
      rushing_attempts: "0.1",
      total_rushing_yards: "15",
      rushing_average_yards_per_attempt: "15",
      rushing_yards_per_game: "0.9",
      total_rushing_touchdowns: "0",
      longest_rush: "15",
      rushing_first_downs: "1",
      rushing_first_down_percentage_first: "100",
      rushing_yards_each_twenty_plus: "0",
      rushing_yards_each_forty_plus: "0",
      rushing_fumbles: "0"
    } |> Repo.insert!

    :ok
  end
end
