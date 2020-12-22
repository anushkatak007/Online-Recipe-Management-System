import connection as cnc

def write_comment():
    print('*'*120)
 ## writes a user's comment
    recipe_name=input("Which recipe you want to comment on?\n")
    flag=True
    while(flag):
        if(cnc.check_for_Blanks(recipe_name)==False):
            recipe_name=input("Enter the recipe you're looking for! \n")
        else:
            flag=False
    sql = "select recipe_id,recipe_name from `recipe` where `recipe_name` = %s"
    cnc.c.execute(sql, (recipe_name))
    p=[]
    result = cnc.c.fetchall()
    if (cnc.c.rowcount==0):
        print("Recipe does not exist!!\n")
    else:
        for row in result:
            p.append(row['recipe_id'])
            print(row)

        recipe_id=(input("From the list above, which recipe_id is the one you want to leave a comment on?\n"))
        flag=True
        while(flag):
            if(cnc.check_for_Blanks(recipe_id)==False):
                recipe_id=(input("From the list above, which recipe_id is the one you want to leave a comment on?\n"))
            else:
                try:
                    recipe_id=int(recipe_id)
                    if(recipe_id in p):
                        flag=False
                    else:
                        print("Choose a valid recipe_id!\n")
                        recipe_id=(input("From the list above, which recipe_id is the one you want to leave a comment on?\n"))
                          
                except ValueError  :
                    print("Please enter a numeric value\n")
                    recipe_id=(input("From the list above, which recipe_id is the one you want to leave a comment on?\n"))

                    
        comment=input("Enter your comment  \n")
        flag=True
        while(flag):
            if(cnc.check_for_Blanks(comment)==False):
                comment=input("Enter your comment  \n")
            else:  
                flag=False
        sql = "INSERT INTO `comments` (`user_id`,`recipe_id`,`comment`)VALUES (%s, %s,%s)"
        cnc.c.execute(sql, (cnc.user_id,recipe_id,comment))
        print("Comment entered!\n")
        cnc.conn.commit()


def display_comment():
    ##displays all comments on a specified recipe
    print('*'*120)
    recipe_name=input("Enter name of recipe for which you'd like to view comments ?\n")
    flag=True
    while(flag):
        if(cnc.check_for_Blanks(recipe_name)==False):
            recipe_name=input("Enter the recipe you're looking for! \n")
        else:
            flag=False
    sql = "select recipe_id,recipe,recipe_name from `recipe` where `recipe_name`= %s"
    cnc.c.execute(sql, (recipe_name))
    p=[]
    result = cnc.c.fetchall()
    if (cnc.c.rowcount==0):
        print("Recipe does not exist!!\n")
    else:
        for row in result:
            p.append(row['recipe_id'])
            print("recipe_id \t recipe \t recipe_name \n")
            print(row['recipe_id'],'\t',row['recipe'],'\t',row['recipe_name'],'\n')

        recipe_id=(input("From the list above, which recipe_id is the one you're looking for?\n"))
        flag=True
        while(flag):
            if(cnc.check_for_Blanks(recipe_id)==False):
                 recipe_id=(input("From the list above, which recipe_id is the one you're looking for?\n"))
            else:
                try:
                    recipe_id=int(recipe_id)
                    if(recipe_id in p):
                        flag=False
                    else:
                        print("Choose a valid recipe_id!\n")
                        recipe_id=(input("From the list above, which recipe_id is the one you want to leave a comment on?\n"))
                          
                except ValueError  :
                    print("Please enter a numeric value\n")
                    recipe_id=(input("From the list above, which recipe_id is the one you want to leave a comment on?\n"))
                    
                
        sql = "select comment from `comments` where `recipe_id`= %s"
        cnc.c.execute(sql, (recipe_id))
        result = cnc.c.fetchall()
        if (cnc.c.rowcount==0):
            print("No comments on this one yet!!\n")
        else:
            for row in result:
                print(row['comment'])  
        cnc.conn.commit()   
 


def edit_comment():
    print('*'*120)
##fetch all comments by this user and ask which one he wants to delete
    sql=("select c.recipe_id,r.recipe_name,  c.comment_id, c.comment from comments c join recipe r on r.recipe_id=c.recipe_id where c.user_id=%s") 
    cnc.c.execute(sql,cnc.user_id)
    result = cnc.c.fetchall()
    p=[]
    if (cnc.c.rowcount==0):
        print("You have not commented yet!!\n")
    else:
        for row in result:
            print('recipe_id \t recipe_name \t comment_id \t comment \n')
            p.append(row['comment_id'])
            print(row['recipe_id'],'\t',row['recipe_name'],'\t',row['comment_id'],'\t',row['comment'],'\t')
    comment_id=input("Enter comment_id for the comment you want to edit?\n")
    flag=True
    while(flag):
        if(cnc.check_for_Blanks(comment_id)==False):
            comment_id=input("Enter comment_id for the comment you want to edit?\n")
        else:
                try:
                    comment_id=int(comment_id)
                    if(comment_id in p):
                        flag=False
                    else:
                        print("Choose a valid comment_id!\n")
                        comment_id=input("Enter comment_id for the comment you want to edit?\n")
                          
                except ValueError  :
                    print("Please enter a numeric value\n")
                    comment_id=input("Enter comment_id for the comment you want to edit?\n")
                    
    comment=input("Write your updated comment  \n")
    flag=True
    while(flag):
        if(cnc.check_for_Blanks(comment)==False):
            comment=input("Write your updated comment  \n")
        else:
            flag=False
    sql = "update `comments` set `comment`= %s where `comment_id`= %s"
    cnc.c.execute(sql, (comment,comment_id))
    print("Editing.. \n")
    print("Comment Edit successful!!\n")   
    cnc.conn.commit() 
    
def delete_comment():
   
 ## Deletes an existing entry for a user's comment
     ##fetch all comments by this user and ask which one he wants to delete
    sql=("select c.recipe_id,r.recipe_name,  c.comment_id, c.comment from comments c join recipe r on r.recipe_id=c.recipe_id where c.user_id=%s") 
    cnc.c.execute(sql,cnc.user_id)
    result = cnc.c.fetchall()
    if (cnc.c.rowcount==0):
        print("No comments on this one yet!!\n")
        pass

    else:
        print("Here's a list of all your comments")
        p=[]
        for row in result:
            p.append(row['comment_id'])
            print("comment_id \t comment")
            print(row['comment_id'],'\t',row['comment'])  
 
        comment_id=input("Enter comment_id for the comment you want to delete?\n")
        flag=True
        while(flag):
            if(cnc.check_for_Blanks(comment_id)==False):
                comment_id=input("Enter comment_id for the comment you want to delete?\n")
            else:
                try:
                    comment_id=int(comment_id)
                    if(comment_id in p):
                        flag=False
                    else:
                        print("Choose a valid comment_id!\n")
                        comment_id=input("Enter comment_id for the comment you want to delete?\n")
                          
                except ValueError  :
                    print("Please enter a numeric value\n")
                    comment_id=input("Enter comment_id for the comment you want to delete?\n")

                
        sql = "delete from `comments` where `comment_id`= %s"
        cnc.c.execute(sql, (comment_id))
        print("Deleting.. \n")
        print("Comment deletion successful!!\n")   
        cnc.conn.commit() 
