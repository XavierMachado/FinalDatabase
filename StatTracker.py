from getpass import getpass
from mysql.connector import connect, Error
#from data import Data

def teamInfo(string):
    return 0

def seasonalStats(string):
    return 0

def bestGrade(string):
    return 0;

def display(string):
    team = input("What team are you looking for? ")
    #Check if team is in data
    if team
    print("What would you like to do?")
    print("""
          1 View Team Info
          2 Print Out Seasonal Stats
          3 Find the player with the best performance
            """)
    inp = input("Enter Option: ")
    if inp == '1':
        return teamInfo(string)
    elif inp == '2':
        return seasonalStats(string)
    elif inp == '3':
        return bestGrade(string)
    else:
        print("Not a valid input.")

def main():
    try:
        with connect(
            host="localhost",
            user=input("Enter username: "),
            password=getpass("Enter password: "),
            database = "FinalProject.sql"
        ) as connection:
            exe = ""
            exe = display(exe)
            with connection.cursor() as c: #execute final SQL statement
                c.execute(exe)
                print("Returned Rows From DB:")
                columns = c.description 
                result = [{columns[index][0]:column for index, column in enumerate(value)} for value in c.fetchall()]
                for row in result:
                    print(row)
    except Error as e:
        print(e)

main()