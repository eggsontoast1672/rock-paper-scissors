# Rock Paper Scissors

A silly little rock paper scissors game.

## Overview

I created this repository quite a long time ago. It was originally written in
C, but since I'm in my Gleam phase right now, I just have to rewrite it in
Gleam. The implementation strives to be a mostly verbatim rewrite of the C
version.

## Usage

I'm sure most know the rules of Rock Paper Scissors, but just in case you
don't, here's how it works:

First, you pick a move out of either rock, paper, or scissors. Note that the
game will only accept the strings `rock`, `paper`, or `scissors` verbatim as
input. That means that inputting the string `Rock` will cause an error.

After you pick your move, the computer player will pick its move. Then, the
winner will be determined based on the rule that rock beats scissors, scissors
beat paper, and paper beats rock. I suppose the reasoning is that rock squishes
scissors, scissors cut paper, and paper wraps rock? Some of those don't make a
whole ton of sense, but I digress.

In addition to the three move commands, typing `Ctrl+d` at the prompt will
cause the program to exit. At that point, you will be able to see some nice end
game statistics.

## Compiling and Running

All you need to run the code is the Gleam compiler, which you can most likely
get through your system's package manager if you're on Linux. If you're on
Windows or Mac, you probably need to download the compiler from the Gleam
website. As with all gleam projects, you can use the following command to run
the code:

```sh
gleam run
```

That's all there is to it!

## License

This software is licensed under the MIT license. You can use the code for
whatever you want, edit it, redistrubite it, sell it, I do not care. All you
have to do is include this license with the software and not claim that you
wrote it.
