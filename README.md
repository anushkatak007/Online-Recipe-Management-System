# Online-Recipe-Management-System


	
Readme:

1.	Run the database export dump provided. This will ensure creating the database ‘recipe_management’ and using it for the rest of the execution. Next, the dump script creates all the procedures in the script in your local system(MYSQL Workbench) and runs them, The script contains creating and runnning databse programming objects(stored procedures) to create required tables for the management system and populate them.
2.	Now download the folder ‘application code’(as submitted under Assignment), make sure all files are kept in the same package(recipe_management.py, fun_facts.py, recipe_functions.py, feedback_functions.py, comments_funcitons.py, connection.py). These files define required funcitons to perform various operations based on user’s choice. The main file is – recipe_management.py. We need to execute and run this file in a terminal, use command ‘python recipe_management.py’ . Make sure you run the terminal in the folder these files exist. Use ‘cd’ command to change directory.
3.	Once this is done, the management system is in place.
a.	Provide connection details (user password) to connect to your database(MYSQL Workbench localhost credentials)
 
b.	Once connection is established, the program is well built to instruct you at each point.
The next step is whether to sign up as a new user to this system, or log in as an existing user. Similar to any website where you need to be a member first to access its contents, the management systems provided you the option.
c.	If you have an account, you can login using the credentials and the program after validation brings you to the home page where you can select from multiple operations. Or, you can create your account by feeding in relevant information.
d.	While answering any question(for eg. Enter full name), press enter when you are done entering your response. Once sign up is done, the program brings you back to the log in page for you to login.
e.	Once log in is successful, you are shown the variety of operations to choose from. If it fails, the program lets you re-attempt.

 

f.	At each operation, the program provided user with information about either successful operation or a failure message providing a reason and next step to rectify the error. After successful operation, you are brought back to the home page, unless you select explicitly to exit the program(Option 12).
1. Search a recipe – enter name of the recipe you’re looking for, and the program displays all recipes with that name.
2. Enter a new recipe – you can enter your recipe, fill in few recipe related responses. Some egs of questions are recipe name, recipe, ingredients, cook time, servings. If all valid selections are made, the recipe is entered in the database for all users to view. 
3. Delete a recipe –  you enter name of recipe you want to delete, it displays all recipes associated with that name. You select from that list which recipe you want to delete, if that recipe was contributed by you, the program deletes it and prints success message, else displays ‘You can’t delete someone else’s recipe’ message.
4. Give comment – You enter which recipe you’d like to comment on. On valid selection, you enter your comment on prompt and the comment is entered successfully for that recipe. 
5. Edit comment - displays all your comments, asks you to select which comment to edit. Now you enter new comment and the database is updated with edited comment. If you haven’t provided any comment so far, it notifies you of the same
6. Delete comment - displays all your comments, asks you to select which comment to delete. If your selection is valid, the program deletes your comment. If you haven’t provided any comment so far, it notifies you of the same
7. Views comment – displays all your comments on different recipes.
8. View fun facts – displays fun facts about the recipes database.
9. Delete your account – since you’re logged in, no verification needed at this point. Deletes your account from database. Now your credentials no longer work to log in.
10. Give feedback – takes feedback from you and enters in the system for admin’s view.
11. Delete Feedback -- displays all your feedbacks to the system in the past, asks you to select which feedback to delete. It removes the feedback from the database if it is a valid selection. If you haven’t provided any feedback so far, it notifies you of the same.
12. exits the program.

