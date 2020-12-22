import mysql.connector
import sys
import pymysql
from recipe_functions import *
from comments_functions import *
from feedback_functions import *
from fun_facts import *
import connection as cnc


def main():
	### Describes the order in which operations should be performed.Connection establishment first, then schema creation.  """
    print('*'*120)
    print(sys.version)
    print("Welcome to Recipe Management System \n")
    print("Setting up the Connection....\n")
    cnc.initialize()

    if cnc.conn is not None:
        print("Setting up...\n")
    else:
        print("Error! cannot create the database connection.\n")
        print('*'*120)
    flag=True
    while(flag):
        signup=input(" Sign up? Enter YES if you're a new user or NO, if you're a registered user \n")
        signup=signup.lower()
        signup=signup.strip()
        if signup == 'yes':
            cnc.sign_up()
            flag=False
        elif signup == 'no':
            cnc.log_in()
            flag=False
        else:
            print("Invalid choice\n")
            

    flag_home=True
    while(flag_home):
        print('*'*120)
        choice=input(" Press \n 1 to search a recipe\n 2 to enter a new recipe \n 3 to delete an existing recipe\n 4 to give a comment \n 5 to edit a comment \n 6 to delete a comment \n 7 to view comments \n 8 to view fun facts \n 9 to delete your account\n 10 to give feedback to our System\n 11 to delete your feedback \n 12 to exit \n")
        print('*'*120)
        flag=True
        while(flag):
            if(cnc.check_for_Blanks(choice)==False):
                choice=input(" Press \n 1 to search a recipe\n 2 to enter a new recipe \n 3 to delete an existing recipe\n 4 to give a comment \n 5 to edit a comment \n 6 to delete a comment \n 7 to view comments \n 8 to view fun facts \n 9 to delete your account\n 10 to give feedback to our System\n 11 to delete your feedback \n 12 to exit \n")
                print('*'*120)
            else:
                try : 
                    choice=int(choice)
                    flag=False
                except ValueError  :
                    print("Please enter a numeric value\n")
                    choice=input(" Press \n 1 to search a recipe\n 2 to enter a new recipe \n 3 to delete an existing recipe\n 4 to give a comment \n 5 to edit a comment \n 6 to delete a comment \n 7 to view comments \n 8 to view fun facts \n 9 to delete your account\n 10 to give feedback to our System\n 11 to delete your feedback \n 12 to exit \n")
        if choice == 1:
                search_recipe()  
        elif choice == 2:
                enter_recipe()
        elif choice == 3:
                delete_recipe()     
        elif choice == 4:
            write_comment()       
        elif choice == 5:
            edit_comment()
        elif choice == 6:
            delete_comment()
        elif choice == 7:
            display_comment()  
        elif choice == 8:
            fun_facts() 
        elif choice == 9:
            cnc.delete_user() 
        elif choice == 10:
            give_feedback()
        elif choice == 11:
            delete_feedback()
        elif choice == 12:
            print("Come again soon!!")
            exit()
        else:
            print("Invalid choice\n")
        
            

""" Starts execution from here"""
if __name__ == '__main__':
        
        main()
