
# Concept

This project idea was not original as before me there were already similar apps out there either for displaying use or deploying it to the app store. For me this was a just a passion project as a beginner chef lately, I wanted to provide a application for users to create and share recipes all in while other users can review it.

The application allows users to create a recipe with/without a picture, post,reviews without a page reload(ajax request), like the recipes, check out their own and other users’ profiles showcasing their recipes, and the app also displays the list of topics and posts with pagination.

Lastly, users can create new ingredients and recipes styles to effectively distinguish what type the recipe is and what ingredient it as as that was priority for me as a safety concern(allergy reasons, etc.) for the users.

# Sign Up

When going the url, the user is treated with a simple login page in which users can sign in/sign up, tabs in which guests or users who are not loggin can still navigate.

To start off, a User has choice of signing up or signing in a created account.
Once a user has created an account, they will get redirect the main recipies page.

* Clicking on Sign Up Button
![Signing Up](/gifs/sign-up.gif "Signing Up")

* Creating an account
![Creating Account](/gifs/create-account.gif "Creating an account")

# Signing In and Out

If a user has already created their account they have the option to then navigate next page that being the main recipes page.

* Signing In
![Signing In](/gifs/sign-in.gif "Signing In")

* Signing Out
![Signing Out](/gifs/sign-out.gif "Signing Out")

# User Profile

Users can also check their own profile and see what recipes they have written.
They also can edit their name on the account.

* Checking User Profile
![Checking User Profile](/gifs/user-profile.gif "Checking User Profile")

* Editing User Name
![Editing User Name](/gifs/edit-name.gif "Editing User Name")


# All Recipes Page and Users Page

A user can search through either a list of all recipes or users stored in the database.

* All Recipes Page
![All Recipes Page](/gifs/all-recipes-page.gif "All Recipes Page")

* All Users Page
![All Users Page](/gifs/all-users-page.gif "All Users Page")


# Styles and Ingredients

A recipe has to have ingredients and different styles of cooking for that recipe,so this feature allows users to create a new style or a ingredient and use it as tag when creating a new recipe.

Additionally, when clicking on the selected style, it will show a list of recipe with the selected style. If it's a certain ingredient was selected, then it will show a list of recipe with the selected ingredient.

* Creating a new style
![Creating a new style](/gifs/new-style.gif "Creating a new style")

* Creating A new Ingredient
![Creating A new Ingredient](/gifs/new-ingredient.gif "Creating A new Ingredient")

* Viewing a selected style page
![Viewing a selected style page](/gifs/all-styles.gif "Viewing a selected style page")

* Viewing a ingredient style page
![Viewing a ingredient style page](/gifs/all-ingredients.gif "Viewing a ingredient style page")


# Recipe CRUD

A user can create or edit a recipe. Also a new recipe has to fit the requirements to be created.

* Recipe Validation
![Recipe Validation](/gifs/post-requirements.gif "Recipe Validation")

* Creating a new recipe(with tags)
![Creating a new recipe](/gifs/new-recipe.gif "Creating a new recipe")

* Editing a recipe(if it belongs to the user)
![Editing a recipe](/gifs/edit-recipe.gif "Editing a recipe")

* Deleting a recipe(if it belongs to the user)
![Deleting a recipe](/gifs/delete-recipe..gif "Deleting a recipe")

# Reviews

Users can leave a review on any recipe page.

* Leaving a review
![Leaving a review](/gifs/review.gif "Leaving a review")

# Technologies Used:

- Ruby on Rails Framework
- Javascript
- Ruby
- Sqlite3
- HTML5
- CSS3


# Gemfiles Used:

- uglifier
- coffee-rails
- jquery-rails
- turbolinks
- jbuilder
- sdoc
- bootstrap-sass
- carrierwave
- mini_magick
- autoprefixer-rails
- will_paginate
- bootstrap-will_paginate
- bcrypt
- fog