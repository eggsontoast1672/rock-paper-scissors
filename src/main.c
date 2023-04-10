#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "computer.h"
#include "player.h"

int main(void)
{
    RpsMove player_move;
    RpsMove computer_move;

    srand(time(NULL));

    printf("Welcome to Rock Paper Scissors! Please refer to the README more information.\n");
    printf("\n");

    player_move = rps_player_get_move();
    computer_move = rps_computer_get_move();

    printf("You went %s\n", rps_move_to_string(player_move));
    printf("Computer went %s\n", rps_move_to_string(computer_move));
    printf("\n");

    if (rps_move_beats_move(computer_move) == player_move) {
        printf("Player wins!\n");
    } else if (rps_move_beats_move(player_move) == computer_move) {
        printf("Computer wins!\n");
    } else {
        printf("It's a tie!\n");
    }

    return 0;
}
