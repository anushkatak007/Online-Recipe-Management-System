import connection as cnc
def fun_facts():
    print("************FUN FACTS *****************")
    print('*'*120)
    print("The most active user by recipe contribution is \n")
    sql = "with cte as (select distinct user_id from  (Select  user_id, count(user_id) from recipe group by user_id order by COUNT(user_id) desc )p limit 1)select u.full_name from users u join cte on cte.user_id=u.user_id;"
    cnc.c.execute(sql)
    result = cnc.c.fetchall()
    for row in result:
        print(row['full_name'])


    print('*'*120)
    print("The recipe with most comments is \n")
    sql = "with cte as (select distinct recipe_id from ( select recipe_id, count(recipe_id) from comments group by recipe_id order by count(recipe_id) desc ) p limit 1)select r.recipe_name from recipe r join cte on r.recipe_id=cte.recipe_id;"
    cnc.c.execute(sql)
    result = cnc.c.fetchall()
    for row in result:
        print(row['recipe_name'])


    print('*'*120)
    print("The recipe that can be fastest prepared is \n")
    sql = "select distinct recipe_name from recipe where cook_time=(select min((cook_time)) from recipe );"
    cnc.c.execute(sql)
    result = cnc.c.fetchall()
    for row in result:
        print(row['recipe_name'])

    print('*'*120)
    print("The average time(in mins) to cook any Italian dish is \n")
    sql = "select  avg(r.cook_time) Average_cook_time from recipe r join cuisine c on c.cuisine_id=r.cuisine_id where c.cuisine_name='Italian'"
    cnc.c.execute(sql)
    result = cnc.c.fetchall()
    for row in result:
        print(row['Average_cook_time'])