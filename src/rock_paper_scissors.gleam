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
  let assert Ok(line) = erlang.get_line("Enter your move: ")
  case line {
    "rock\n" -> Some(Rock)
    "paper\n" -> Some(Paper)
    "scissors\n" -> Some(Scissors)
    "quit\n" -> None
    _ -> {
      io.println("Please enter a valid more, or quit to exit.\n")
      get_player_move()
    }
  }
}

fn get_computer_move() -> Move {
  case int.random(3) {
    0 -> Rock
    1 -> Paper
    2 -> Scissors
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

      let GameStats(games, wins) = stats
      case get_win_state(player_move, computer_move) {
        Win -> {
          io.println("Player wins!\n")
          play_game(GameStats(games + 1, wins + 1))
        }
        Draw -> {
          io.println("It's a tie!\n")
          play_game(GameStats(games + 1, wins))
        }
        Loss -> {
          io.println("Computer wins!\n")
          play_game(GameStats(games + 1, wins))
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
