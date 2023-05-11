#include "player.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BUFFER_LENGTH 64

static int parse_move_string_internal(const char *string, RpsMove *move);
static void read_line_internal(char *buffer, size_t length);

RpsMove rps_player_get_move(void)
{
    char buffer[BUFFER_LENGTH];
    RpsMove move;
    int parsing_error_occurred;

    do {
        printf("Enter your move: ");
        read_line_internal(buffer, BUFFER_LENGTH);
        parsing_error_occurred = parse_move_string_internal(buffer, &move);
        if (parsing_error_occurred)
            printf("Please enter either 'rock', 'paper', or 'scissors'\n");
    } while (parsing_error_occurred);
    return move;
}

static int parse_move_string_internal(const char *string, RpsMove *move)
{
    if (strcmp(string, "rock") == 0) {
        *move = RPS_MOVE_ROCK;
        return 0;
    }
    if (strcmp(string, "paper") == 0) {
        *move = RPS_MOVE_PAPER;
        return 0;
    }
    if (strcmp(string, "scissors") == 0) {
        *move = RPS_MOVE_SCISSORS;
        return 0;
    }
    return 1;
}

static void read_line_internal(char *buffer, size_t length)
{
    char *nl;

    if (fgets(buffer, length, stdin) == NULL) {
        fprintf(stderr, "Failed to get string from stdin\n");
        exit(1);
    }
    nl = strchr(buffer, '\n');
    if (nl != NULL)
        *nl = '\0';
}
