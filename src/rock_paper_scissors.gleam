import gleam/erlang
import gleam/int
import gleam/io

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
    Rock, Rock -> Draw
    Paper, Rock -> Win
    Scissors, Rock -> Loss
    Rock, Paper -> Loss
    Paper, Paper -> Draw
    Scissors, Paper -> Win
    Rock, Scissors -> Win
    Paper, Scissors -> Loss
    Scissors, Scissors -> Draw
  }
}

fn get_player_move() -> Move {
  let assert Ok(line) = erlang.get_line("Enter your move: ")
  case line {
    "rock\n" -> Rock
    "paper\n" -> Paper
    "scissors\n" -> Scissors
    _ -> {
      io.println("Please enter either 'rock', 'paper', or 'scissors'")
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

pub fn main() -> Nil {
  io.println(
    "Welcome to Rock Paper Scissors! Please refer to the README for more information.\n",
  )

  let player_move = get_player_move()
  let computer_move = get_computer_move()

  io.println("You went " <> move_to_string(player_move))
  io.println("Computer went " <> move_to_string(computer_move) <> "\n")

  case get_win_state(player_move, computer_move) {
    Win -> io.println("Player wins!")
    Draw -> io.println("It's a tie!")
    Loss -> io.println("Computer wins!")
  }
}
