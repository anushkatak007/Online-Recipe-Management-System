import flask
import mysql.connector
import sys
import pymysql
import recipe_management as rm

def check_for_Blanks(myString):
    # myString is not None AND myString is not empty or blank
    if myString and myString.strip(): 
        return True
    else:
        print("You entered an empty string!\n Let's try again \n")
        return False
    # myString is None OR myString is empty or blank
    

global usr
## for testing purposes, root is the username and password is password in local database connection.
usr=input("Enter username for connecting to Database \n")
flag=True
while(flag):
    if(check_for_Blanks(usr)==False):
        usr=input("Enter username for connecting to Database \n")
    else:
        flag=False
global pwd
pwd=input("Enter password for connecting to Database\n")
flag=True
while(flag):
    if(check_for_Blanks(pwd)==False):
        pwd=input("Enter password for connecting to Database\n")
    else:
        flag=False

def initialize():

    database="recipe_management"
    ##  configures connection details for the SQL Engine and creates the connection. Database used is recipe_management.Takes username and password from user. Default system: user = root, pwd = password
    global conn 
    #conn = None
    global c
    try:
        conn = pymysql.connect(host='localhost', user=usr, password=pwd,db='recipe_management', charset='utf8mb4',cursorclass=pymysql.cursors.DictCursor)
        print(" Connection established! \n")
        print('*'*120)
        c=conn.cursor() 
    except:
        print("Connection failed!\n")
        print('*'*120)

def log_in():
 ## Validates credentials of a user 

    email_id = input("Enter your email_id\n ")
    flag=True
    while(flag):
        if(check_for_Blanks(email_id)==False):
            email_id = input("Enter your email_id\n ")
        else:
            flag=False
    password = input("Enter your password\n")
    flag=True
    while(flag):
        if(check_for_Blanks(password)==False):
            password = input("Enter your password\n")
        else:
            flag=False    
    sql = "select user_id,password from `users` where `email_id`= %s"
    c=conn.cursor()
    c.execute(sql, (email_id))
    result = c.fetchone()
    if (c.rowcount==0):
        print("No such email registered with us!!\n")
        log_in()
    else:
        global user_id
        user_id=int(result['user_id'])
        if password==result['password']:
            print('*'*120)
            print("Welcome!\n")
        
        else:
            print("Oops, the information you entered is wrong, try again!\n")
            log_in()
    conn.commit()


def sign_up():
## Creates a new entry for a new user
    
    
    full_name = input("Enter your full name\n ")
    flag=True
    while(flag):
        if(check_for_Blanks(full_name)==False):
            full_name = input("Enter your full name\n ")
        else:
            flag=False
    email_id = input("Enter your email_id\n ")
    flag=True
    while(flag):
        if(check_for_Blanks(email_id)==False):
            email_id = input("Enter your email_id\n ")
        else:
            flag=False
    password = input("Enter your password\n ")
    flag=True
    while(flag):
        if(check_for_Blanks(password)==False):
            password = input("Enter your password\n ")
        else:
            flag=False
        flag=True
        while (flag):
            preference =input("Select your food preference\n 1. Vegetarian \n2. non-vegetarian\n3. Pescatarian \n4. Vegan \n5. None of the mentioned\n")
            if(check_for_Blanks(preference) == False):
                preference =input("Select your food preference\n 1. Vegetarian \n2. non-vegetarian\n3. Pescatarian \n4. Vegan \n5. None of the mentioned\n")
            else:
                
                try : 
                    preference=int(preference)
                    if preference== 1 :
                        preference="vegetarian"
                        flag=False
                    elif preference==2:
                        preference="non-vegetarian"
                        flag=False
                    elif preference==3:
                        preference="pescatarian"
                        flag=False
                    elif preference==4:
                        preference="vegan"
                        flag=False
                    elif preference==5:
                        preference='None'
                        flag=False
                    else:
                        print("Invalid choice, please choose again")
                except ValueError  :
                        print("Please enter a numeric value\n")
                        preference=input("Select your food preference\n 1. Vegetarian \n2. non-vegetarian\n3. Pescatarian \n4. Vegan \n5. None of the mentioned\n")
        diet_restric = input("Enter any diet restrictions you might have: -  like No nuts, No dairy, No meat, No fish, or None \n ")

        
        sql = "INSERT INTO `users` (`full_name` , `email_id`, `password` , `preference` ,  `diet_restric` ) VALUES (%s, %s,%s, %s,%s)"
        c=conn.cursor()
        c.execute(sql, (full_name,email_id,password,preference,diet_restric))
        conn.commit()
        print('*'*120)
        print("Welcome, you're now a Registered User!!\n")
        log_in()
    

def delete_user():
 ## Deletes an existing entry for a user
  
    print("We're sad to let you go! Come again soon, deleting profile..\n")
    print('*'*120)
    sql = "delete from users where `user_id`= %s"
    c.execute(sql, (user_id))
    conn.commit()
    choice=input("Enter 1 to exit\n 2 to re-register \n")
    flag=True
    while(flag):
        if(check_for_Blanks(choice)==False):
            choice=input("Enter 1 to exit\n 2 to re-register \n")
        else:
            try : 
                choice=int(choice)
                if choice == 1:
                    exit()
                elif choice ==2:
                    rm.main()
                else:
                    print("Enter a valid choice\n")
                    choice=input("Enter 1 to exit\n 2 to re-register \n")
                flag=False
            except ValueError  :
                print("Please enter a numeric value\n")
                choice=input("Enter 1 to exit\n 2 to re-register \n")
                          





