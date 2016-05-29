# Upgrade Complete

## Team Min and Yang

## Project
Our game is essentially a DLC quest, where players
spend money to upgrade several aspects of the
game itself, including music and graphics.

## How to Run Upgrade Complete
1. Install Processing v3+
2. Clone the GitHub repo (git clone https://github.com/brian-yang/Upgrade-Complete). Make sure you're on the master branch. If not, do 'git checkout master'.
3. Open Processing and open upgrade_complete.pde. Click the run button to play.
<br>
Our demo version for May 23rd/24th shows that we have created the foundations for playing a basic version of the game and have started to add upgrades.

## Project Plan
* Get screen transitioning to work [Done]
* Get basic minigame shooter to work [Done]
* Allow users to buy items in the shop [Done]
* Get intro screen to explain the game [Done]
* Get the following upgrades to work:
  * Backgrounds [Done]
  * Player movement [In progress]
  * Weapons [In progress]
  * Music
  * Fonts
  * Sprites
  * Button Appearance
* Make minigame shooter more complex (eg, have user protect a base)

## Development Log
### 5/14/16
* Set up screen infrastructure
* Tested controlP5 library
* Made test buttons

### 5/15/16
* Created more screens
* Started work on space shooter minigame
* Started work on menu screen

### 5/16/16
* Fixed enemy targeting bugs with minigame
* Fixed game end screen

### 5/17/16
* Able to slow / delay certain functions

### 5/19/16
* Got money counter to display
* Tested file parsing

### 5/20/16
* Started work on upgrade framework and save data in a text file
* Set cash limit

### 5/21/16
* Finished simplified Menu screen
* Created buttons for upgrades
* Allow players to buy upgrades
* Work on getting background upgrades to work

### 5/23/16
* Fixed spawn dimensions for enemies

### 5/24/16
* Fixed resolution & almost complete intro screen

### 5/25/16
* Finished background upgrades
* Worked on minigame graphics upgrades
* Added laser as a weapon to minigame
* Reposition sprites in minigame
* Finish intro screen

### 5/26/16
* Updated winning condition
* Worked on different levels
* Worked on player movement upgrades & weapon upgrades

### 5/27/16
* Level increased on win
* Gave the player the ability to rotate and move

### 5/28/16
* Got shooter to shoot in the same direction player is facing

### 5/29/16
* Got collision detection to work for bullets
* Got shooter to shoot several bullets
* Added constants