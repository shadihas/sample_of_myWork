# tech_t 

# OSOSS Flutter Developer Technical Test

This repository contains my solution for the OSOSS technical test for Flutter developers. The purpose of this test is to evaluate my proficiency in Flutter development, including clean code practices, problem-solving skills, and understanding of UI/UX implementation.

## Task Overview

The goal of this test was to create a Flutter application with the following features:

1. **Splash Screen:** Display the Flutter logo at the center of the screen for 3 seconds before proceeding to the Home screen.

2. **Home Screen:** This screen includes the following components:
   - A text field for user input.
   - A text widget that updates with the text entered in the text field.
   - A "Clear" button to reset the text field and text widget.
   - Buttons to navigate to Page 1 (Animations page) and Page 2 (Pokémon page).

3. **Animations Page (Page 1):** This page presents:
   - Text at the top reflecting the input from the previous screen.
   - A central widget displaying the selected shape.
   - Three shape options at the bottom. Clicking a shape animates the central widget to match the selected shape.

4. **Pokémon Page (Page 2):** This page follows these steps:
   - Fetches Pokémon data from the Pokémon API.
   - Displays a loader in the center while data is loading.
   - Displays a list of Pokémon cards once the data is fetched.
   - Each card includes an image and name of the Pokémon.
   - Bonus: Pokémon images are displayed.

## Implementation Highlights

In addition to the main features, I implemented the following enhancements:

- **Pagination:** Implemented pagination for fetching Pokémon data(name and image) in chunks for  Faster loading, efficient data use, smooth scrolling, instant interaction, memory efficiency, scalability, and optimized APIs for enhanced performance on the Pokemons screen.

- **State Management:** Employed the Bloc pattern for efficient state management and to ensure a consistent user experience.

## Getting Started

To run the application on your local machine, follow these steps:

1. Clone this repository: 

   git clone https://github.com/shadihas/tech_t.git

## Contact
Developed by Shadi Hasan . Feel free to reach out at shadihas2@gmail.com for any questions or inquiries.

 ## Acknowledgments
I would like to express my appreciation to OSOSS for providing this opportunity to showcase my Flutter development skills. This project allowed me to demonstrate my abilities and learn valuable concepts in Flutter app development.
