defmodule TheScoreWeb.Schema.Mutation.CreatePlayerProfileTest do
  use TheScoreWeb.ConnCase, async: true

  alias TheScore.{Repo, Player}
  import Ecto.Query

  setup do
    TheScore.Seeds.run()
  end

  @query """
  mutation ($playerProfile: PlayerProfileInput!) {
    createPlayerProfile(input: $playerProfile) {
      name
      team
      position
    }
  }
  """
  test "createPlayerProfile field creates an profile" do
    player_profile = %{
      "name" => "John Doe",
      "team" => "São Bento",
      "position" => "attack"
    }
    conn = build_conn()
    conn = post conn, "/api",
      query: @query,
      variables: %{"playerProfile" => player_profile}

    assert json_response(conn, 200) == %{
      "data" => %{
        "createPlayerProfile" => %{
          "name" => player_profile["name"],
          "team" => player_profile["team"],
          "position" => player_profile["position"]
        }
      }
    }
  end
end
