from getpass import getpass
from mysql.connector import connect, Error

def findTeam(team):
    # SQL Query
    query = f"""
    SELECT * FROM College WHERE CollegeName = '{team}';
    """
    return query

def teamInfo(team):
    # SQL Query
    query = f"""
    SELECT CollegeName, Mascot, Coach, FoundedYear, StadiumName
    FROM College
    WHERE CollegeName = '{team}';
    """
    return query

def seasonalStats(team):
    # SQL Query
    query = f"""
    SELECT
        'Team' AS EntityType,
        pgs.TeamID,
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
        AVG(pgs.PlayerPerformanceGrade) AS AvgPlayerPerformanceGrade
    FROM
        PlayerGameStats pgs, College
    WHERE
        pgs.TeamID = (SELECT College.TeamID FROM College WHERE CollegeName = '{team}')
    GROUP BY
        pgs.TeamID;
    """
    return query

def grades(team):
    # SQL Query
    query = f"""
    SELECT
        p.PlayerID,
        CONCAT(p.FirstName, ' ', p.LastName) AS PlayerName,
        AVG(pgs.PlayerPerformanceGrade) AS AveragePerformanceGrade
    FROM
        PlayerGameStats pgs
    JOIN
        Player p ON pgs.PlayerID = p.PlayerID
    WHERE
        pgs.TeamID = (SELECT College.TeamID FROM College WHERE CollegeName = '{team}')
    GROUP BY
        p.PlayerID
    ORDER BY
        AVG(pgs.PlayerPerformanceGrade) DESC;
    """
    return query

def display(connection):
    while True:
        team = input("What college are you looking for? ")
        result = findTeam(team)

        with connection.cursor() as c:
            c.execute(result)
            # Fetch one row
            row = c.fetchone()

        if not row:
            print(f"Team '{team}' not found. Please check spelling and try again.")
            continue

        print("What would you like to access?")
        print("""
              1 Team Info
              2 Team Seasonal Stats
              3 Average Performance Grades
              """)
        inp = input("Enter Option: ")

        if inp == '1':
            return teamInfo(team)
        elif inp == '2':
            return seasonalStats(team)
        elif inp == '3':
            return grades(team)
        else:
            print("Not a valid input.")
            continue

def main():
    try:
        with connect(
            host="localhost",
            user=input("Enter username: "),
            password=getpass("Enter password: "),
            database="STATS"
        ) as connection:
            exe = display(connection)
            
            with connection.cursor() as c:
                c.execute(exe)
                print("\nReturned Rows From DB:")
                
                columns = c.description 
                results = [{columns[index][0]: column for index, column in enumerate(row)} for row in c.fetchall()]
                
                for result in results:
                    for key, value in result.items():
                        print(f'{key}: {value}')
                    print()  # Add a new line between rows
    except Error as e:
        print(e)

main()


