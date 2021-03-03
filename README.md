# TheScore
Phoenix Application using Absinthe GraphQL

# Dependencies
Elixir 1.11.3 (compiled with Erlang/OTP 23)
Phoenix - 1.5.7
Absinthe - 1.4
PostgreSQL - 13.1

- [] Missing cast values
- [] Download csv file
- [] Front end application
- [] Explain the solution

Install the project
```bash
$ git@github.com:betocattani/nfl-rushing.git
```

install dependencies
```
$ cd nfl-rushing
```
# Populate database with the file rushing.json
```elixir
iex> TheScore.ImportPlayers.import("dev/support/rushing.json")
```

To start your Phoenix server:
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000/graphiql) from your browser to
access the GraphQL Playground

list all Players Profiles
```javascript
{
  players {
    name
    position
    rushingAttempts
    rushingAttemptsPerGameAvg
    rushingAverageYardsPerAttempt
    rushingFirstDownPercentageFirst
    rushingFirstDowns
    rushingFumbles
    rushingYardsEachFortyPlus
    rushingYardsEachTwentyPlus
    rushingYardsPerGame
    team
    totalRushingTouchdowns
    totalRushingYards
  }
}
```

Mutation to create a new Player Profile
```javascript
mutation {
  createProfile(longestRush: "3",
    name: "Periclao",
    position: "AT",
    rushingAttempts: "6",
    rushingAttemptsPerGameAvg: "3",
    rushingAverageYardsPerAttempt: "3.7",
    rushingFirstDownPercentageFirst: "3",
    rushingFirstDowns: "1",
    rushingFumbles: "9",
    rushingYardsEachFortyPlus: "3",
    rushingYardsEachTwentyPlus: "2",
    rushingYardsPerGame: "9",
    team: "Phoenix",
    totalRushingTouchdowns: "1",
    totalRushingYards: "8"
  ) {
    name
    position
    rushingAttempts
    rushingAttemptsPerGameAvg
    rushingAverageYardsPerAttempt
    rushingFirstDownPercentageFirst
    rushingFirstDowns
    rushingFumbles
    rushingYardsEachFortyPlus
    rushingYardsEachTwentyPlus
    rushingYardsPerGame
    team
    totalRushingTouchdowns
    totalRushingYards
  }
}
```

# Mutation using variables
```javascript
mutation ($playerProfile: PlayerProfileInput!) {
  createPlayerProfile(input: $playerProfile) {
    errors {
      key
      message
    }
    playerProfile {
      name
      team
      position
    }
  }
}

// variables
{
  "playerProfile": {
    "name": "Joao bosco",
    "team": "bentao",
    "position": "midle"
  }
}
```

Query with arguments
```javascript
// {"term": "Jo"}

query ($term: String) {
  players(matching: $term, order: DESC) {
    name
  }
}
```

Using filters
```javascript
{
  players(filter: {
    name: "Cattani",
    totalRushingYards: "8",
    longestRush: "3",
    totalRushingTouchdowns: "1"
  }) {
    name
    longestRush
    totalRushingYards
    totalRushingTouchdowns
  }
}
```

Using filter with Variables
```javascript
query ($filter: PlayerProfileFilter!) {
  players(filter: $filter) {
    name
  }
}

{
"filter": {
    "longestRush": "15",
    "totalRushingTouchdowns": "0",
    "totalRushingYards": "15"
  }
}

or

{"filter": {}}
```
