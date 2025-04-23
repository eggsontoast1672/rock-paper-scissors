import gleam/erlang
import gleam/int
import gleam/io
import gleam/option.{type Option, None, Some}

type Move {
  Rock
  Paper
  Scissors
}

fn move_to_string(move: Move) -> String {
  case move {
    Rock -> "rock"
    Paper -> "paper"
    Scissors -> "scissors"
  }
}

type GameState {
  Win
  Draw
  Loss
}

fn get_win_state(player: Move, computer: Move) -> GameState {
  case player, computer {
    Rock, Scissors | Paper, Rock | Scissors, Paper -> Win
    Rock, Rock | Paper, Paper | Scissors, Scissors -> Draw
    Rock, Paper | Paper, Scissors | Scissors, Rock -> Loss
  }
}

fn get_player_move() -> Option(Move) {
  case erlang.get_line("Enter your move: ") {
    Ok("rock\n") -> Some(Rock)
    Ok("paper\n") -> Some(Paper)
    Ok("scissors\n") -> Some(Scissors)
    Error(erlang.Eof) -> None
    Error(erlang.NoData) -> {
      io.println("An IO error occurred, please try again.\n")
      get_player_move()
    }
    _ -> {
      io.println("Please enter a valid more, or Ctrl+d to exit.\n")
      get_player_move()
    }
  }
}

fn get_computer_move() -> Move {
  case int.random(3) {
    0 -> Rock
    1 -> Paper
    2 -> Scissors

    // Control flow should never reach this branch, but if it does, that would
    // indicate that Rock, Paper, and Scissors are not equally likely.
    _ -> panic
  }
}

type GameStats {
  GameStats(games: Int, wins: Int)
}

fn play_game(stats: GameStats) -> GameStats {
  case get_player_move() {
    None -> stats
    Some(player_move) -> {
      let computer_move = get_computer_move()
      io.println("You went " <> move_to_string(player_move))
      io.println("Computer went " <> move_to_string(computer_move) <> "\n")

      case get_win_state(player_move, computer_move) {
        Win -> {
          io.println("Player wins!\n")
          play_game(GameStats(stats.games + 1, stats.wins + 1))
        }
        Draw -> {
          io.println("It's a tie!\n")
          play_game(GameStats(stats.games + 1, stats.wins))
        }
        Loss -> {
          io.println("Computer wins!\n")
          play_game(GameStats(stats.games + 1, stats.wins))
        }
      }
    }
  }
}

pub fn main() -> Nil {
  io.println(
    "Welcome to Rock Paper Scissors! Please refer to the README for more information.\n",
  )

  let GameStats(games, wins) = play_game(GameStats(games: 0, wins: 0))
  io.println("Games played: " <> int.to_string(games))
  io.println("Games won: " <> int.to_string(wins))
}
