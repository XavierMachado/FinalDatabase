from getpass import getpass
from mysql.connector import connect, Error

def findTeam(team):
    # SQL Query (you might need to replace 'teams' with your actual table name)
    if team is None:
        return None
    return team

def teamInfo(team):
    # SQL Query
    query = f"""
    SELECT CollegeName, Mascot, Coach, FoundedYear, StadiumName
    FROM College
    WHERE CollegeName = '{team}';
    """
    return query

def seasonalStats(team):
    # Replace 'PlayerGameStats' with your actual table name
    query = f"""
    SELECT
        'Team' AS EntityType,
        TeamID,
        SUM(PassingAttempts) AS TotalPassingAttempts,
        SUM(PassYards) AS TotalPassYards,
        AVG(PassingPercentage) AS AvgPassingPercentage,
        SUM(InterceptionsThrown) AS TotalInterceptionsThrown,
        SUM(Carries) AS TotalCarries,
        SUM(RushingYards) AS TotalRushingYards,
        SUM(Receptions) AS TotalReceptions,
        SUM(ReceptionYards) AS TotalReceptionYards,
        SUM(Fumbles) AS TotalFumbles,
        SUM(Touchdowns) AS TotalTouchdowns,
        SUM(Tackles) AS TotalTackles,
        SUM(TacklesForLoss) AS TotalTacklesForLoss,
        SUM(Sacks) AS TotalSacks,
        SUM(PassBreakUps) AS TotalPassBreakUps,
        SUM(Interceptions) AS TotalInterceptions,
        AVG(PlayerPerformanceGrade) AS AvgPlayerPerformanceGrade
    FROM
        PlayerGameStats AND College
    WHERE
        TeamID = (SELECT TeamID FROM teams WHERE CollegeName = '{team}')
    GROUP BY
        TeamID;
    """
    return query

def grades(team):
    # SQL Query
    query = f"""
    -- Your best grade query here
    """
    return query

def display():
    team = input("What college are you looking for? ")
    
    # Check if team is in data
    result = findTeam(team)
    
    if result is None:
        print("Team Not Found. Please Check Spelling and try again")
        display()

    print("What would you like to access?")
    print("""
          1 Team Info
          2 Seasonal Stats
          3 Average Performance Grades
          """)
    inp = input("Enter Option: ")

    if inp == '1':
        query = teamInfo(team)
    elif inp == '2':
        query = seasonalStats(team)
    elif inp == '3':
        query = grades(team)
    else:
        print("Not a valid input.")
        return

    return query

def main():
    try:
        with connect(
            host="localhost",
            user=input("Enter username: "),
            password=getpass("Enter password: "),
            database="FinalProject.sql"
        ) as connection:
            exe = display()
            
            with connection.cursor() as c:
                c.execute(exe)
                print("Returned Rows From DB:")
                
                columns = c.description 
                result = [{columns[index][0]: column for index, column in enumerate(value)} for value in c.fetchall()]
                
                for row in result:
                    print(row)
    except Error as e:
        print(e)

main()
