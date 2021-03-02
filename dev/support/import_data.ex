defmodule TheScore.ImportPlayers do
  def import(filename) do
    filename
    |> File.read!
    |> Jason.decode!
    |> format_players
    |> create_profiles
  end

  defp create_profiles(players) do
    Enum.map players, fn(player) ->
      TheScore.Players.create_profile(player)
    end
  end

  defp format_players(players) do
    Enum.map players, fn(player) ->
      %{
        name: player["Player"],
        team: player["Team"],
        position: player["Pos"],
        rushing_attempts: to_string(player["Att"]),
        rushing_attempts_per_game_avg: to_string(player["Att/G"]),
        total_rushing_yards: to_string(player["Yds"]),
        rushing_average_yards_per_attempt: to_string(player["Avg"]),
        rushing_yards_per_game: to_string(player["Yds/G"]),
        total_rushing_touchdowns: to_string(player["TD"]),
        longest_rush: to_string(player["Lng"]),
        rushing_first_downs: to_string(player["1st"]),
        rushing_first_down_percentage_first: to_string(player["1st%"]),
        rushing_yards_each_twenty_plus: to_string(player["20+"]),
        rushing_yards_each_forty_plus: to_string(player["40+"]),
        rushing_fumbles: to_string(player["FUM"])
      }
    end
  end
end
