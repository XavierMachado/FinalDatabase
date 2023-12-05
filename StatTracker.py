from getpass import getpass
from mysql.connector import connect, Error

try:
    with connect(
        host="localhost",
        user=input("Enter username: "),
        password=getpass("Enter password: "),
        database = "Assignment4"
    ) as connection:
        sCode = ""
        sCode = generalFunc(sCode)
        with connection.cursor() as c: #execute final SQL statement
            c.execute(sCode)
            print("Returned Rows From DB:")
            columns = c.description 
            result = [{columns[index][0]:column for index, column in enumerate(value)} for value in c.fetchall()]
            for row in result:
                print(row)
except Error as e:
    print(e)

# Replace these with actual data
college_data = (1, 'Tigers', 'Coach Smith', 1990, 'Tiger Stadium')
player_data = (1, 'John', 'Doe', 'Senior', 'Quarterback')
team_player_relationship_data = (1, 1)
game_data = (1, '2023-09-01', '19:00', 'Stadium A', 1, 28, True, '1-0')
player_game_stats_data = (1, 1, 1, 20, 250, 70.2, 0, 8, 40, 0, 0, 1, 2, 2, 1, 0.0, 1, 0, 90.5)

# Connect to the database
conn = sqlite3.connect('your_database.db')
cursor = conn.cursor()

# Execute the queries with actual data
cursor.execute("INSERT INTO College (TeamID, Mascot, Coach, FoundedYear, StadiumName) VALUES (?, ?, ?, ?, ?)", college_data)
cursor.execute("INSERT INTO Player (PlayerID, FirstName, LastName, Class, Positions) VALUES (?, ?, ?, ?, ?)", player_data)
cursor.execute("INSERT INTO TeamPlayerRelationship (TeamID, PlayerID) VALUES (?, ?)", team_player_relationship_data)
cursor.execute("INSERT INTO Game (GameID, Date, Time, Location, TeamID, TeamScore, Won, OverallRecord) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", game_data)
cursor.execute("INSERT INTO PlayerGameStats (GameID, PlayerID, TeamID, PassingAttempts, PassYards, PassingPercentage, InterceptionsThrown, Carries, RushingYards, Receptions, ReceptionYards, Fumbles, Touchdowns, Tackles, TacklesForLoss, Sacks, PassBreakUps, Interceptions, PlayerPerformanceGrade) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", player_game_stats_data)

# Commit the changes and close the connection
conn.commit()
conn.close()
