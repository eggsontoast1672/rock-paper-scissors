import gleam/io

type Move {
  Rock
  Paper
  Scissors
}

fn move_to_string(move: Move) -> String {
  todo
}

type GameState {
  Win
  Draw
  Loss
}

fn get_win_state(player: Move, computer: Move) -> GameState {
  todo
}

fn get_player_move() -> Move {
  todo
}

fn get_computer_move() -> Move {
  todo
}

pub fn main() -> Nil {
  io.println(
    "Welcome to Rock Paper Scissors! Please refer to the README for more information.\n",
  )

  let player_move = get_player_move()
  let computer_move = get_computer_move()

  io.println("You went " <> move_to_string(player_move))
  io.println("Computer went " <> move_to_string(computer_move))

  case get_win_state(player_move, computer_move) {
    Win -> io.println("Player wins!")
    Draw -> io.println("It's a tie!")
    Loss -> io.println("Computer wins!")
  }
}
