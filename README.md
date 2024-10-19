# To-Do App

A simple and efficient To-Do List application built using **Flutter** and **Provider** for state management. The app allows users to add, edit, delete, and manage tasks efficiently with features like search functionality and organized task completion.

## Features

- **Add Tasks**: Users can easily add new tasks with titles and descriptions.
- **Edit Tasks**: Modify existing tasks through a simple edit interface.
- **Task Search**: Quickly search for tasks using the search bar on the home screen.
- **Task Sorting**: Automatically sorts tasks with completed tasks pushed to the bottom of the list.
- **Provider State Management**: The app leverages `Provider` to manage the state across the application efficiently.
- **Responsive UI**: UI elements like text fields and buttons are centered, with consistent styling and input validation.

## Screens

### 1. Home Screen
The home screen displays a list of tasks with a search bar. Users can search for tasks and see them dynamically filtered as they type.

### 2. Add/Edit Task Screen
This screen allows users to add new tasks or edit existing ones. It features:
- **Task Title**: A required field to input the task title.
- **Task Description**: An optional field to input a detailed description of the task.
- **Save Button**: Allows users to save their task (either adding a new task or updating an existing one).

## UI Improvements

- The **search bar** only opens the keyboard when clicked and includes a custom design with rounded corners.
- Both **Add/Edit Task** screens are centered inside a `Card` view with an elevated, rounded outline.
- `TextFormFields` include custom `OutlineInputBorder` for a polished and user-friendly experience.
- Styled **Save Button** with rounded corners and padding for better usability.

  
## Dependencies
1. Flutter - UI toolkit for building natively compiled applications.
2. Provider - State management library for Flutter applications

## Usage
1. Add Task: Click the "Add" button on the home screen to navigate to the add task screen.
2. Edit Task: Tap on any existing task to edit its title or description.
3. Delete Task: Swipe left or right on any task to delete it.
4. Search Tasks: Use the search bar to filter tasks by title.


## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/Sikandar897/todo-app.git

2. Navigate to the project directory:
 ```bash
cd todo-app

3. Install the required dependencies:

 ```bash
flutter pub get

4. Run the app:
 ```bash
flutter run
