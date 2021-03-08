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
        rushing_attempts_per_game_avg: player["Att/G"],
        total_rushing_yards: to_string(player["Yds"]),
        rushing_average_yards_per_attempt: player["Avg"],
        rushing_yards_per_game: player["Yds/G"],
        total_rushing_touchdowns: player["TD"],
        longest_rush: to_string(player["Lng"]),
        rushing_first_downs: player["1st"],
        rushing_first_down_percentage_first: player["1st%"],
        rushing_yards_each_twenty_plus: read_int(player["20+"]),
        rushing_yards_each_forty_plus: read_int(player["40+"]),
        rushing_fumbles: read_int(player["FUM"])
      }
    end
  end

  defp read_int(value) when is_integer(value), do: value
end
