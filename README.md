# sample_of_myWork 

## Task Overview

The goal of this sample is to show how I write clean code including tests.

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

## Implementation Highlights


- **Pagination:** Implemented pagination for fetching Pokémon data(name and image) in chunks for  Faster loading, efficient data use, smooth scrolling, instant interaction, memory efficiency, scalability, and optimized APIs for enhanced performance on the Pokemons screen.

- **State Management:** Employed the Bloc pattern for efficient state management and to ensure a consistent user experience.

## Getting Started

To run the application on your local machine, follow these steps:

1. Clone this repository: 

   git clone https://github.com/shadihas/tech_t.git

## Contact
Developed by Shadi Hasan . Feel free to reach out at shadihas2@gmail.com for any questions or inquiries.
