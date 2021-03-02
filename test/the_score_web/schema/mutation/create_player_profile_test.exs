defmodule TheScoreWeb.Schema.Mutation.CreatePlayerProfileTest do
  use TheScoreWeb.ConnCase, async: true

  setup do
    TheScore.Seeds.run()
  end

  @query """
  mutation ($playerProfile: PlayerProfileInput!) {
    createPlayerProfile(input: $playerProfile) {
      errors { key message}
      playerProfile {
        name
        team
        position
      }
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
          "errors" => nil,
          "playerProfile" => %{
            "name" => player_profile["name"],
            "team" => player_profile["team"],
            "position" => player_profile["position"]
          }
        }
      }
    }
  end

  test "creating a player profile with an existent name fails" do
    player_profile = %{
      "name" => "Marc Mariani",
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
          "errors" => [
            %{"key" => "name", "message" => "has already been taken"}
          ],
          "playerProfile" => nil
        }
      }
    }
  end

  test "creating a player profile with missing position fields" do
    player_profile = %{
      "name" => "Marc Mariani",
      "team" => "São Bento"
    }
    conn = build_conn()
    conn = post conn, "/api",
      query: @query,
      variables: %{"playerProfile" => player_profile}

    assert json_response(conn, 200) == %{
      "data" => %{
        "createPlayerProfile" => %{
          "errors" => [
            %{"key" => "position", "message" => "can't be blank"}
          ],
          "playerProfile" => nil
        }
      }
    }
  end
end
