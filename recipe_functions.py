import connection as cnc

def search_recipe():
 ## Searches for the recipe 
    
    recipe_name=input("Enter the name of the recipe you're looking for! \n")
    flag=True
    while(flag):
        if(cnc.check_for_Blanks(recipe_name)==False):
            recipe_name=input("Enter the recipe you're looking for! \n")

        else:

            flag=False
    print('*'*120)
    recipe_name=recipe_name.strip()
    sql = "select recipe ,prep_time,cook_time,ready_time,nutrition_val from `recipe` where `recipe_name`= %s"

    cnc.c.execute(sql, (recipe_name))
    result = cnc.c.fetchall()
    if (cnc.c.rowcount!=0):
        print("Here's the recipe!!\n")  
        for row in result:
            print("Prep Time \t Cook Time \t Ready Time \t Nutrition Val \t Recipe \n")
            print(row['prep_time'],'\t',row['cook_time'],'\t',row['ready_time'],'\t',row['nutrition_val'],"\n")
            print(row['recipe'])
    else:
        print("No recipe found!\n")
        print('*'*120)
    cnc.conn.commit()   


def enter_recipe():
 ## Makes a new entry for a recipe
    print('*'*120)
    recipe_name=input("What is the name of your recipe?\n")   
    flag=True
    while(flag):
        if(cnc.check_for_Blanks(recipe_name)==False):
            recipe_name=input("What is the name of your recipe? \n")
            recipe_name=recipe_name.strip()
        else:
            flag=False
    recipe_name=recipe_name.strip()
    flag_category=True
    while(flag_category):
        category=(input(" Select category: Press\n 1 for breakfast \n 2 for Dessert \n 3 for Comfort food\n 4 for Lunch\n 5 for Dinner \n 6 for Soup \n 7 for Appetizer \n 8 for Baking \n"))
        flag=True
        while(flag):
            if(cnc.check_for_Blanks(category)==False):
                category=(input(" Select category: Press\n 1 for breakfast \n 2 for Dessert \n 3 for Comfort food\n 4 for Lunch\n 5 for Dinner \n 6 for Soup \n 7 for Appetizer \n 8 for Baking \n"))
            else:
                try : 
                    category=int(category)
                    flag=False
                except ValueError  :
                    print("Please enter a numeric value\n")
                    category=(input(" Select category: Press\n 1 for breakfast \n 2 for Dessert \n 3 for Comfort food\n 4 for Lunch\n 5 for Dinner \n 6 for Soup \n 7 for Appetizer \n 8 for Baking \n"))
                          
        if category == 1:
            category_id=1
            flag_category=False
        elif category == 2:
            category_id=2
            flag_category=False
        elif category == 3:
            category_id=3
            flag_category=False
        elif category == 4:
            category_id=4
            flag_category=False
        elif category == 5:
            category_id=5
            flag_category=False
        elif category == 6:
            category_id=6
            flag_category=False
        elif category == 7:
            category_id=7
            flag_category=False
        elif category == 8:
            category_id=8
            flag_category=False
        else:
            print("Invalid choice\n")
    flag_cuisine=True
    while(flag_cuisine):
        cuisine=(input(" Select cuisine: Press\n 1 for Indian \n 2 for Mexican \n 3 for American\n 4 for Japanese\n 5 for Chinese \n 6 for Carribean \n 7 for Vietnamese \n 8 for Thai \n  9 for Chinese \n 10 for Italian \n "))
        flag=True
        while(flag):
            if(cnc.check_for_Blanks(cuisine)==False):
                cuisine=(input(" Select cuisine: Press\n 1 for Indian \n 2 for Mexican \n 3 for American\n 4 for Japanese\n 5 for Chinese \n 6 for Carribean \n 7 for Vietnamese \n 8 for Thai \n  9 for Chinese \n 10 for Italian \n "))
            else:
                try : 
                    cuisine=int(cuisine)
                    flag=False
                except ValueError  :
                    print("Please enter a numeric value\n")
                    cuisine=(input(" Select cuisine: Press\n 1 for Indian \n 2 for Mexican \n 3 for American\n 4 for Japanese\n 5 for Chinese \n 6 for Carribean \n 7 for Vietnamese \n 8 for Thai \n  9 for Chinese \n 10 for Italian \n "))
                           
        if cuisine == 1:
            cuisine_id=1
            flag_cuisine=False
        elif cuisine == 2:
            cuisine_id=2
            flag_cuisine=False
        elif cuisine == 3:
            cuisine_id=3
            flag_cuisine=False
        elif cuisine == 4:
            cuisine_id=4
            flag_cuisine=False
        elif cuisine == 5:
            cuisine_id=5
            flag_cuisine=False
        elif cuisine == 6:
            cuisine_id=6
            flag_cuisine=False
        elif cuisine == 7:
            cuisine_id=7
            flag_cuisine=False
        elif cuisine == 8:
            cuisine_id=8
            flag_cuisine=False
        elif cuisine == 9:
            cuisine_id=9
            flag_cuisine=False
        elif cuisine == 10:
            cuisine_id=10
            flag_cuisine=False
        else:
            print("Invalid choice\n")
    
    recipe=input("Let's start with the recipe now. Press Enter when done-  \n")
    flag=True
    while(flag):
        if(cnc.check_for_Blanks(recipe)==False):
            recipe=input("Let's start with the recipe now. Press Enter when done -  \n")
        else:
            flag=False
    ingredients=input("Enter ingredients for the recipe. Press Enter when done\n")
    flag=True
    while(flag):
        if(cnc.check_for_Blanks(ingredients)==False):
            ingredients=input("Enter ingredients for the recipe .Press Enter when done \n")
        else:
            flag=False
    prep_time=input("Enter preparation time (in minutes) for the recipe.\n")
    flag=True
    while(flag):
        if(cnc.check_for_Blanks(prep_time)==False):
            prep_time=input("Enter preparation time (in minutes) for the recipe.\n")
        else:
            prep_time=prep_time.strip()
            try : 
                prep_time = int(prep_time)
                flag=False
            except ValueError  :
                print("Please enter a numeric value\n")
                prep_time=input("Enter preparation time (in minutes) for the recipe.\n")
               
                    
    cook_time=input("Enter cook time (in minutes)  for the recipe.\n")
    flag=True
    while(flag):
        if(cnc.check_for_Blanks(cook_time)==False):
            cook_time=input("Enter cook time (in minutes) for the recipe.\n")
        else:
            cook_time=cook_time.strip()
            try : 
                cook_time = int(cook_time)
                flag=False
            except ValueError  :
                print("Please enter a numeric value\n")
                cook_time=input("Enter cook time (in minutes) (in minutes) for the recipe.\n")
        
    ready_time=input("Enter ready time (in minutes) for the recipe.\n")
    flag=True
    while(flag):
        if(cnc.check_for_Blanks(ready_time)==False):
            ready_time=input("Enter ready time (in minutes) for the recipe.\n")
        else:
            ready_time=ready_time.strip()
            try : 
                ready_time = int(ready_time)
                flag=False
            except ValueError  :
                print("Please enter a numeric value\n")
                ready_time=input("Enter ready time (in minutes) (in minutes) for the recipe.\n")
            else:
                flag=False
    servings=(input("Enter servings for the recipe.\n"))
    flag=True
    while(flag):
        if(cnc.check_for_Blanks(servings)==False):
            servings=(input("Enter servings for the recipe.\n"))
        else:
            servings=servings.strip()
            try : 
                servings = int(servings)
                flag=False
            except ValueError  :
                print("Please enter a numeric value\n")
                servings=(input("Enter servings for the recipe.\n"))
    flag=True
    nutrition_val=input("Enter nutrition value (in cal)  for the recipe.\n")
    while(flag):
        if(cnc.check_for_Blanks(nutrition_val)==False):
            nutrition_val=input("Enter nutrition value (in cal)  for the recipe.\n")
        else:
            nutrition_val=nutrition_val.strip()
            try : 
                nutrition_val = int(nutrition_val)
                flag=False
            except ValueError  :
                print("Please enter a numeric value\n")
                nutrition_val=input("Enter nutrition value (in cal)  for the recipe.\n")
    sql = "INSERT INTO `recipe` (`recipe_name`,`user_id`,`category_id`,`cuisine_id`,`recipe` , `ingredients`, `prep_time` , `cook_time` ,  `ready_time`,`servings`,`nutrition_val` ) VALUES (%s, %s ,%s, %s,%s, %s,%s, %s,%s,%s,%s)"
    cnc.c.execute(sql, (recipe_name, cnc.user_id,category_id,cuisine_id,recipe,ingredients,prep_time,cook_time,ready_time,servings, nutrition_val))
    cnc.conn.commit()
    print('*'*120)
    print("Thank you for contributing\n")
    print('*'*120)

def delete_recipe():
 ## Deletes an existing entry for a recipe
    print('*'*120)
    recipe_name=input("Enter name of recipe you want to delete?  \n")
    flag=True
    while(flag):
        if(cnc.check_for_Blanks(recipe_name)==False):
            recipe_name=input("Enter the recipe you're looking for! \n")
        else:
            flag=False
    sql = "select distinct user_id from `recipe` where `recipe_name`= %s"
    cnc.c.execute(sql, (recipe_name))
    result = cnc.c.fetchall()
    p=[]
    for row in result:
        p.append(row['user_id'])
    if (cnc.user_id in p):
        sql = "delete from `recipe` where `recipe_name`= %s and user_id=%s"
        cnc.c.execute(sql, (recipe_name,cnc.user_id))
        print("Deletion successful!\n")
    else:
        print("Oops,You can not delete someone else's recipe!\n")
    cnc.conn.commit() 