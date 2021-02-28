defmodule TheScoreWeb.Schema.Query.PlayerProfilesTest do
  use TheScoreWeb.ConnCase, async: true

  setup do
    TheScore.Seeds.run()
  end

  @query """
  {
    allPlayers {
      name
      position
      team
    }
  }
  """
  test "allPlayers field returns players profiles" do
    conn = build_conn()
    conn = get conn, "/api", query: @query
    assert json_response(conn, 200) == %{
      "data" => %{
        "allPlayers" => [
          %{"name" => "Joe Banyard", "team" => "JAX", "position" => "RB"},
          %{"name" => "Johnny Holton", "team" => "OAK", "position" => "WR"},
          %{"name" => "Tommylee Lewis", "team" => "NO", "position" => "WR"},
          %{"name" => "Marc Mariani", "team" => "TEN", "position" => "WR"}
        ]
      }
    }
  end
end
