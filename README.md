# Phoenix Application using Absinthe GraphQL

### Dependencies
- Elixir 1.11.3 (compiled with Erlang/OTP 23)
- Phoenix - 1.5.7
- Absinthe - 1.4
- PostgreSQL - 13.1

## Install the project
```bash
$ git clone git@github.com:betocattani/nfl-rushing.git
```

To config the Phoenix application:
  * $ cd `nfl-rushing`
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

## Populate database with the file rushing.json
```bash
$ iex -S mix
```

```elixir
iex> TheScore.ImportPlayers.import("dev/support/rushing.json")
```
## Access the GraphQL Playground
Now you can visit [`localhost:4000`](http://localhost:4000/graphiql) from your browser

## List all Players
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

## Mutatation to create a new Player
```javascript
mutation {
  createProfile(
    longestRush: "3",
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

or 

## Creates a new Player using query variables
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

// query variables
{
  "playerProfile": {
    "name": "Joao bosco",
    "team": "bentao",
    "position": "midle"
  }
}
```

## Find players using filter by name
```javascript
{
  players(filter: {name: "Luiz Cattani"}) {
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

## Find players using filter in query variables

Availables filters: `[name / totalRushingYards / longestRush / totalRushingTouchdowns]`
```javascript
query ($filter: PlayerProfileFilter!) {
  players(filter: $filter, order: DESC) {
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

// Query Variables
{
  "filter": {
    "name": "Kevin"
    "totalRushingYards": "8",
    "longestRush": "3",
    "totalRushingTouchdowns": "1"
  }
}

// or

{"filter": {}}
```
