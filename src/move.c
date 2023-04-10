#include "move.h"

RpsMove rps_move_beats_move(RpsMove move)
{
    RpsMove result;

    switch (move) {
    case RPS_MOVE_ROCK:
        result = RPS_MOVE_PAPER;
        break;
    case RPS_MOVE_PAPER:
        result = RPS_MOVE_SCISSORS;
        break;
    case RPS_MOVE_SCISSORS:
        result = RPS_MOVE_ROCK;
        break;
    }
    return result;
}

const char *rps_move_to_string(RpsMove move)
{
    const char *result;

    switch (move) {
    case RPS_MOVE_ROCK:
        result = "rock";
        break;
    case RPS_MOVE_PAPER:
        result = "paper";
        break;
    case RPS_MOVE_SCISSORS:
        result = "scissors";
        break;
    }
    return result;
}
