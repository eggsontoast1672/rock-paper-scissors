#ifndef RPS_MOVE_H
#define RPS_MOVE_H

typedef enum {
    RPS_MOVE_ROCK,
    RPS_MOVE_PAPER,
    RPS_MOVE_SCISSORS
} RpsMove;

RpsMove rps_move_beats_move(RpsMove move);
const char *rps_move_to_string(RpsMove move);

#endif
