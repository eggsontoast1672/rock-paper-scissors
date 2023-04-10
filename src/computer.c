#include "computer.h"

#include <stdlib.h>

RpsMove rps_computer_get_move(void)
{
    /* It's okay to hard-code this, I think, since there will never be any
     * other elements in the enum other than rock, paper, and scissors */
    return rand() % 3;
}
