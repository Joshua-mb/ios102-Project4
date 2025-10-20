# Project 4 - *Memory Game*

Submitted by: **Joshua Mburu**

**Memory Game** is an app that challenges players to match pairs of emoji cards by remembering their positions. Players can customize the difficulty by choosing different numbers of card pairs, and the game tracks their progress as they flip cards to find matches.

Time spent: **5** hours spent in total

## Required Features

The following **required** functionality is completed:

- [x] App loads to display a grid of cards initially placed face-down:
  - Upon launching the app, a grid of cards should be visible.
  - Cards are facedown to indicate the start of the game.
- [x] Users can tap cards to toggle their display between the back and the face: 
  - Tapping on a facedown card should flip it to reveal the front.
  - Tapping a second card that is not identical should flip both back down
- [x] When two matching cards are found, they both disappear from view:
  - Implement logic to check if two tapped cards match.
  - If they match, both cards should either disappear.
  - If they don't match, they should return to the facedown position.
- [x] User can reset the game and start a new game via a button:
  - Include a button that allows users to reset the game.
  - This button should shuffle the cards and reset any game-related state.
 
The following **optional** features are implemented:

- [x] User can select number of pairs to play with (at least 2 unique values like 2 and 4).
  * (Hint: user Picker)
- [x] App allows for user to scroll to see pairs out of view.
  * (Hint: Use a Scrollview)
- [x] Add any flavor you'd like to your UI with colored buttons or backgrounds, unique cards, etc. 
  * Enhance the visual appeal of the app with colored buttons, backgrounds, or unique card designs.
  * Consider using animations or transitions to make the user experience more engaging.

The following **additional** features are implemented:

- [x] Implemented smooth card flip animations
- [x] Added 1-second delay before unmatched cards flip back
- [x] Created interactive size picker with 5 difficulty options (4, 6, 8, 10, 12 pairs)
- [x] Color-coded buttons (orange for Choose Size, green for Reset Game)
- [x] Visual feedback in size picker showing currently selected difficulty

## Video Walkthrough

Here's a walkthrough of implemented user stories:

[Add your Loom video link here]

[Guide on how to embed Loom videos on GitHub](https://www.youtube.com/watch?v=GA92eKlYio4)

## Notes

One challenge encountered while building the app was implementing the game logic for tracking card states. Initially, when users selected a new game size from the picker, the number of cards wouldn't update properly. This was solved by passing the `resetGame()` function as a closure to the `SizePickerView` component, ensuring that whenever a user selects a new difficulty level, the game board automatically regenerates with the correct number of card pairs and properly shuffles them.

## License

    Copyright 2025 Joshua Mburu

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
