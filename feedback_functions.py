import connection as cnc


def give_feedback():
    print('*'*120)
 ## gives feedback for the system
    feedback= input("Thanks for your feedback. Enter it here  \n")
    
    flag=True
    while(flag):
        if(cnc.check_for_Blanks(feedback)==False):
            feedback= input("Thanks for your feedback. Enter it here  \n")
        else:
            
            flag=False

    sql = "INSERT INTO `feedback` (`user_id`,`feedback`)VALUES (%s, %s)"
    cnc.c.execute(sql, (cnc.user_id,feedback))
    cnc.conn.commit()



def delete_feedback():
    print('*'*120)
 ## Deletes an existing entry for a user's feedback
    p=[]
    sql = "select feedback_id, feedback from `feedback` where `user_id`= %s"
    cnc.c.execute(sql, (cnc.user_id))
    result = cnc.c.fetchall()
    if (cnc.c.rowcount==0):
        print("You haven't provided us a feedback yet!!\n")
    else:
        print("Here's a list of all your feedback")
        for row in result:
            print("Feedback\t feedback_id\t")
            p.append(row['feedback_id'])

            print(row['feedback'],'\t',row['feedback_id']) 

        feedback_id=input("From the list above, which feedback_id is the one you want to delete?\n")
        flag=True
        while(flag):
            if(cnc.check_for_Blanks(feedback_id)==False):
                feedback_id=input("From the list above, which feedback_id is the one you want to delete?\n")
            else:
                try:
                    feedback_id=int(feedback_id)
                    if(feedback_id in p):
                        flag=False
                    else:
                        print("Choose a valid recipe_id!\n")
                        feedback_id=input("From the list above, which feedback_id is the one you want to delete?\n")
                          
                except ValueError  :
                    print("Please enter a numeric value\n")
                    feedback_id=input("From the list above, which feedback_id is the one you want to delete?\n")
                    
        sql = "delete from `feedback` where `feedback_id`= %s"
        cnc.c.execute(sql, (feedback_id))
        print("Feedback deletion successful!!\n")   
        cnc.conn.commit() 
