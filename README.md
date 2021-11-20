In this flutter project, i have built a tic-tac-toe app, which lets 2 players play together, on the same device. One player is Green, and the other is Red.
If a player wins, the floating button on the bottm right side of the page will show a "Play again", which means, that a player has won the game. Once you press it, the game will
be restarted. If there is no winner, the game will automatically restart.
For the colors, i have used a color list, and for the tic-tac-toe, algorithm, i took a list of 9 integers, all being 0 at the beginning. If player 1 chooses a position, then that position's value in the arrays will be updated. Same applies for player 2. When the game ends, all is reseted, and you can play a new game.
I have used a function to verify the winning cases, and another function, to verify if there are still empty positions on the table. I have used griedview, GestureDetector, and AnimatedContainer, alongside some other widgets.
