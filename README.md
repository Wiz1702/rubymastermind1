# rubymastermind 
**Design Document**

**Interface**
The user interface will be a text-based interface that runs in the terminal. The user will see the following:

A prompt to enter your name.
A welcome message and instructions on how to play the game.
A prompt to enter the number of pegs (4-6) and the number of colors (4-8) they want to play with.
An input area where the user can enter their guesses. Each guess will consist of a sequence of colors specified using letters or numbers.
Feedback on each guess, indicating the number of correct colors in the correct positions (exact matches) and the number of correct colors in the wrong positions (color matches).
A message indicating whether the user won or lost the game, along with the secret code if they lost.
The user will input their guesses by typing the corresponding letters or numbers for each color in their guess.

**Features**
The game will support the following features:

Customizable number of pegs: The user can select the number of pegs they want to be used in the game (4-6).
Customizable number of colors: The user can select the number of colors they want to be used in the game (4-8).


**Object-Oriented Design**
Game Class
Description: This class represents the overall game and manages the gameplay.

Variables:

pegs: The number of pegs(holes to fill) in the game.
colors: The number of colors in the game.
secret_code: The secret code generated for the game.
num_guesses: The number of guesses made by the user.
game_over: Boolean value to indicate if the game is over.
Methods:

initialize(pegs, colors): Initializes the game with the specified number of pegs and colors. Generates a secret code.
play_game(): Runs the main game loop.
validate_guess(guess): Validates the user's guess to ensure it has the correct number of pegs and uses valid colors.
check_guess(guess): Checks the user's guess against the secret code and provides feedback.
generate_secret_code(): Generates a random secret code using the specified number of pegs and colors.
is_game_over(): Checks if the game is over based on the number of guesses made and the success of the last guess.
Player Class
Description: This class represents a player in the game, either the user or the computer.

Variables:

name: The name of the player.
is_human: Boolean value to indicate if the player is human or computer.
Methods:

initialize(name, is_human): Initializes the player with the specified name and type.
get_guess(): Retrieves a guess from the player, either by input from the user or by generating a guess for the computer.
Color Class
Description: This class represents a color in the game.

Variables:

name: The name or identifier of the color.
Methods:

initialize(name): Initializes the color with the specified name.
Here is the class diagram showing the relationships between the classes:

+----------+       +----------+       +---------+
|   Game   |<----->|  Player  |<----->|  Color  |
+----------+       +----------+       +---------+
           \           /         
            \         /          
            +-----------------+
            |                 |
         +---------------------------+
         |          Main             |
         +---------------------------+
