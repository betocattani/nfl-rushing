defmodule TheScoreWeb.Schema.Query.PlayerProfilesTest do
  use TheScoreWeb.ConnCase, async: true

  setup do
    TheScore.Seeds.run()
  end

  @query """
  {
    players {
      name
      position
      team
    }
  }
  """
  test "players field returns players profiles" do
    conn = build_conn()
    conn = get conn, "/api", query: @query
    assert json_response(conn, 200) == %{
      "data" => %{
        "players" => [
          %{"name" => "Joe Banyard", "team" => "JAX", "position" => "RB"},
          %{"name" => "Johnny Holton", "team" => "OAK", "position" => "WR"},
          %{"name" => "Marc Mariani", "team" => "TEN", "position" => "WR"},
          %{"name" => "Tommylee Lewis", "team" => "NO", "position" => "WR"}
        ]
      }
    }
  end

  @query """
  {
    players(filter: {name: 123}) {
      name
    }
  }
  """
  test "players field returns errors when using a bad value" do
    response = get(build_conn(), "/api", query: @query)
    assert %{"errors" => [
      %{"message" => message}
    ]} = json_response(response, 200)
    assert message == "Argument \"filter\" has invalid value {name: 123}.\nIn field \"name\": Expected type \"String\", found 123."
  end

  @query """
  {
    players(filter: {name: "Joe"}) {
      name
      position
      team
    }
  }
  """
  test "players field returns players profiles filtered by name" do
    conn = build_conn()
    response = get(conn, "/api", query: @query)
    assert json_response(response, 200) == %{
      "data" => %{
        "players" => [
          %{"name" => "Joe Banyard", "team" => "JAX", "position" => "RB"}
        ]
      }
    }
  end

  @query """
  query ($term: String) {
    players(filter: {name: $term}) {
      name
      position
      team
    }
  }
  """
  @variables %{"term" => "Joe"}
  test "players field returns players profiles filtered by name using a variable" do
    conn = build_conn()
    response = get(conn, "/api", query: @query, variables: @variables)
    assert json_response(response, 200) == %{
      "data" => %{
        "players" => [
          %{"name" => "Joe Banyard", "team" => "JAX", "position" => "RB"}
        ]
      }
    }
  end

  @query """
  query ($order: SortOrder!) {
    players(order: $order) {
      name
    }
  }
  """
  @variables %{"order" => "DESC"}
  test "players field returns profiles descending using literals" do
    response = get(build_conn(), "/api", query: @query, variables: @variables)
    assert %{
      "data" => %{"players" => [%{"name" => "Tommylee Lewis"} | _]}
    } = json_response(response, 200)
  end

  @query """
  query ($order: SortOrder!) {
    players(order: $order) {
      name
    }
  }
  """
  @variables %{"order" => "ASC"}
  test "players field returns items ascending using variables" do
    response = get(build_conn(), "/api", query: @query, variables: @variables)
    assert %{
      "data" => %{"players" => [%{"name" => "Joe Banyard"} | _]}
    } = json_response(response, 200)
  end

  @query """
  query ($filter: PlayerProfileFilter!) {
    players(filter: $filter) {
      name
      longestRush
    }
  }
  """
  @variables %{filter: %{"name" => "Johnny Holton", "longestRush" => "29"}}
  test "players field returns players, filtering with a variable" do
    response = get(build_conn(), "/api", query: @query, variables: @variables)
    assert %{
      "data" => %{"players" => [%{"name" => "Johnny Holton", "longestRush" => "29"}]}
    } == json_response(response, 200)
  end
end
