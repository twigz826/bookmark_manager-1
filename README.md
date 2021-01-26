# Bookmark Manager

A repository for Makers Week 4 Paired Programming project 'bookmark_manager'.

## User Story 1

```
As a User,
So I can see my bookmarks
Show a list of bookmarks
```

An approximate domain model for this user story can be seen below.

![GitHub Logo](/resources/User_Story_01.png)

In steps;
  - The user visits the webpage in the client.
  - The client sends a GET request for the webpage to the controller.
  - The controller requests some of the page's content (`.all` instances of the `Bookmark` class) from the model.
  - The model supplies that content (in the form of an array of `.all` `[bookmarks]`) to the controller.
  - The controller sends the content to the `.erb` view, which formats the content in HTML and CSS.
  - The view supplies the controller, which in turn supplies the client.
  - The client renders the webpage to the user.

### Model/View/Controller Refactoring

| Component   | Responsibility                                | Refactor                                |
|------------ |---------------------------------------------  |---------------------------------------- |
| Model       | Encapsulate logic with relevant data          | Encapsulate bookmark data in a class    |
| View        | Display the result to a user                  | Show the bookmark data in a list        |
| Controller  | Get data from the model and put in the view   | Render bookmark data into to the view   |

## User Story 2

```
As a time-pressed user
So that I can save a website
I would like to add the site's address and title to bookmark manager
```
