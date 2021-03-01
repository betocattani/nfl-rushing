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

  @query """
  {
    allPlayers(matching: "Joe") {
      name
      position
      team
    }
  }
  """
  test "allPlayers field returns players profiles filtered by name" do
    conn = build_conn()
    response = get(conn, "/api", query: @query)
    assert json_response(response, 200) == %{
      "data" => %{
        "allPlayers" => [
          %{"name" => "Joe Banyard", "team" => "JAX", "position" => "RB"}
        ]
      }
    }
  end

  @query """
  {
    allPlayers(matching: 123) {
      name
    }
  }
  """
  test "allPlayers field returns errors when using a bad value" do
    response = get(build_conn(), "/api", query: @query)
    assert %{"errors" => [
      %{"message" => message}
    ]} = json_response(response, 200)
    assert message == "Argument \"matching\" has invalid value 123."
  end
end
