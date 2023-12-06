CREATE SCHEMA STATS;
USE STATS;

-- Create College table
CREATE TABLE College (
    TeamID INT PRIMARY KEY,
    CollegeName VARCHAR(50),
    Mascot VARCHAR(50),
    Coach VARCHAR(50),
    FoundedYear INT,
    StadiumName VARCHAR(50)
);

-- Create Player table
CREATE TABLE Player (
    PlayerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Class VARCHAR(10),
    Positions VARCHAR(50)
);

-- Create TeamPlayerRelationship table to represent the many-to-many relationship between Team and Player
CREATE TABLE TeamPlayerRelationship (
    TeamID INT,
    PlayerID INT,
    PRIMARY KEY (TeamID, PlayerID),
    FOREIGN KEY (TeamID) REFERENCES College(TeamID),
    FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID)
);

-- Create Game table (now combined with TeamGameStats)
CREATE TABLE Game (
    GameID INT PRIMARY KEY,
    Date DATE,
    Time TIME,
    Location VARCHAR(100),
    TeamID INT,
    TeamScore INT,
    Won BOOLEAN, -- Indicates whether the team won (true) or lost (false)
    OverallRecord VARCHAR(10), -- Overall record like "1-0" or "0-1"
    FOREIGN KEY (TeamID) REFERENCES College(TeamID)
);

-- Create PlayerGameStats table to represent the many-to-many relationship between players and games
CREATE TABLE PlayerGameStats (
    GameID INT,
    PlayerID INT,
    TeamID INT,
    PassingAttempts INT,
    PassYards INT,
    PassingPercentage DECIMAL(5,2),
    InterceptionsThrown INT,
    Carries INT,
    RushingYards INT,
    Receptions INT,
    ReceptionYards INT,
    Fumbles INT,
    Touchdowns INT,
    Tackles INT,
    TacklesForLoss INT,
    Sacks FLOAT,
    PassBreakUps INT,
    Interceptions INT,
    PlayerPerformanceGrade FLOAT,
    PRIMARY KEY (GameID, PlayerID),
    FOREIGN KEY (GameID) REFERENCES Game(GameID),
    FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID),
    FOREIGN KEY (TeamID) REFERENCES College(TeamID)
);

/*-- Insert data into College table
INSERT INTO College (TeamID, Mascot, Coach, FoundedYear, StadiumName)
VALUES (?, ?, ?, ?, ?);

-- Insert data into Player table
INSERT INTO Player (PlayerID, FirstName, LastName, Class, Positions)
VALUES (?, ?, ?, ?, ?);

-- Insert data into TeamPlayerRelationship table
INSERT INTO TeamPlayerRelationship (TeamID, PlayerID)
VALUES (?, ?);

-- Insert data into Game table for 12 weeks
INSERT INTO Game (GameID, Date, Time, Location, TeamID, TeamScore, Won, OverallRecord)
VALUES (?, ?, ?, ?, ?, ?, ?, ?);

-- Insert data into PlayerGameStats table
INSERT INTO PlayerGameStats (GameID, PlayerID, TeamID, PassingAttempts, PassYards, PassingPercentage, InterceptionsThrown, Carries, RushingYards, Receptions, ReceptionYards, Fumbles, Touchdowns, Tackles, TacklesForLoss, Sacks, PassBreakUps, Interceptions, PlayerPerformanceGrade)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);*/

-- Insert data into College table
INSERT INTO College (TeamID, CollegeName, Mascot, Coach, FoundedYear, StadiumName)
VALUES (1, 'LSU', 'Tigers', 'Coach Smith', 1990, 'Tiger Stadium');

-- Insert data into Player table
INSERT INTO Player (PlayerID, FirstName, LastName, Class, Positions)
VALUES
    (1, 'John', 'Doe', 'Senior', 'Quarterback'),
    (2, 'Juan', 'Smith', 'Junior', 'Wide Receiver'),
    (3, 'Robert', 'Johnson', 'Sophomore', 'Running Back'),
	(4, 'Tyler', 'Evans', 'Freshman', 'Tight End'),
	(5, 'Derrick', 'Thomas', 'Senior', 'Defensive End'),
	(6, 'David', 'Taylor', 'Junior', 'Defensive Tackle'),
	(7, 'Lucas', 'Morgan', 'Senior', 'Linebacker'),
	(8, 'Cameron', 'Roberts', 'Sophomore', 'Cornerback'),
	(9, 'Samuel', 'Nelson', 'Junior', 'Safety');
    -- Add other players as needed;

-- Insert data into TeamPlayerRelationship table
INSERT INTO TeamPlayerRelationship (TeamID, PlayerID)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (1, 5),
    (1, 6),
    (1, 7),
    (1, 8),
    (1, 9);
    -- Add other player-team relationships as needed;

-- Insert data into Game table for 12 weeks
INSERT INTO Game (GameID, Date, Time, Location, TeamID, TeamScore, Won, OverallRecord)
VALUES
    (1, '2023-09-01', '19:00', 'Stadium A', 1, 28, true, '1-0'),
    (2, '2023-09-08', '19:00', 'Stadium B', 1, 21, false, '1-1'),
    (3, '2023-09-15', '19:00', 'Stadium C', 1, 35, true, '2-1'),
    (4, '2023-09-22', '19:00', 'Stadium D', 1, 14, false, '2-2'),
    (5, '2023-09-29', '19:00', 'Stadium E', 1, 42, true, '3-2'),
    (6, '2023-10-06', '19:00', 'Stadium F', 1, 17, false, '3-3'),
    (7, '2023-10-13', '19:00', 'Stadium G', 1, 28, true, '4-3'),
    (8, '2023-10-20', '19:00', 'Stadium H', 1, 24, false, '4-4'),
    (9, '2023-10-27', '19:00', 'Stadium I', 1, 31, true, '5-4'),
    (10, '2023-11-03', '19:00', 'Stadium J', 1, 14, false, '5-5'),
    (11, '2023-11-10', '19:00', 'Stadium K', 1, 21, true, '6-5'),
    (12, '2023-11-17', '19:00', 'Stadium L', 1, 35, true, '7-5');

-- Insert data into PlayerGameStats table
-- Assuming each player played in every game, you can adjust accordingly based on your data
-- Game 1
INSERT INTO PlayerGameStats (GameID, PlayerID, TeamID, PassingAttempts, PassYards, PassingPercentage, InterceptionsThrown, Carries, RushingYards, Receptions, ReceptionYards, Fumbles, Touchdowns, Tackles, TacklesForLoss, Sacks, PassBreakUps, Interceptions, PlayerPerformanceGrade)
VALUES 
-- QB (PlayerID = 1)
 (1, 1, 1, 20, 250, 70.2, 0, 8, 40, 0, 0, 1, 2, 2, 1, 0.0, 1, 0, 90.5),
-- WR (PlayerID = 2)
 (1, 2, 1, 0, 0, 0.0, 0, 4, 80, 8, 0, 0, 1, 1, 0, 0.0, 0, 1, 70.2),
-- RB (PlayerID = 3)
 (1, 3, 1, 0, 0, 0.0, 0, 15, 120, 2, 0, 1, 2, 2, 0, 0.0, 1, 0, 75.8),
-- TE (PlayerID = 4)
 (1, 4, 1, 0, 0, 0.0, 0, 2, 50, 5, 0, 0, 1, 1, 0, 0.0, 0, 0, 68.5),
-- DE (PlayerID = 5)
 (1, 5, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 2.0, 1, 0, 78.9),
-- DT (PlayerID = 6)
 (1, 6, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 1.0, 0, 0, 75.2),
-- LB (PlayerID = 7)
 (1, 7, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 2.0, 1, 0, 82.3),
-- CB (PlayerID = 8)
 (1, 8, 1, 0, 0, 0.0, 1, 0, 0, 0, 0, 0, 0, 0, 3, 0.0, 0, 3, 65.5),
-- S (PlayerID = 9)
 (1, 9, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1.0, 0, 1, 70.2);
 -- Game 2
INSERT INTO PlayerGameStats (GameID, PlayerID, TeamID, PassingAttempts, PassYards, PassingPercentage, InterceptionsThrown, Carries, RushingYards, Receptions, ReceptionYards, Fumbles, Touchdowns, Tackles, TacklesForLoss, Sacks, PassBreakUps, Interceptions, PlayerPerformanceGrade)
VALUES 
-- QB (PlayerID = 1)
 (2, 1, 1, 25, 220, 63.4, 0, 10, 160, 0, 0, 2, 4, 1, 1, 0.0, 0, 0, 87.9),
-- WR (PlayerID = 2)
 (2, 2, 1, 0, 0, 0.0, 0, 4, 80, 8, 0, 0, 1, 0, 0, 0.0, 1, 0, 70.2),
-- RB (PlayerID = 3)
 (2, 3, 1, 0, 0, 0.0, 0, 20, 220, 0, 0, 2, 4, 1, 0, 0.0, 0, 1, 87.9),
-- TE (PlayerID = 4)
 (2, 4, 1, 0, 0, 0.0, 0, 1, 40, 3, 0, 0, 0, 0, 0, 0.0, 0, 0, 65.8),
-- DE (PlayerID = 5)
 (2, 5, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 3, 1, 0, 1, 0.0, 0, 0, 78.3),
-- DT (PlayerID = 6)
 (2, 6, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0.0, 0, 0, 75.0),
-- LB (PlayerID = 7)
 (2, 7, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 5, 2, 1, 0, 0.0, 0, 0, 82.7),
-- CB (PlayerID = 8)
 (2, 8, 1, 0, 0, 0.0, 1, 0, 0, 0, 0, 2, 1, 0, 2, 0.0, 0, 2, 68.5),
-- S (PlayerID = 9)
 (2, 9, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 3, 1, 0, 0, 0.0, 1, 0, 74.2);
-- Game 3
INSERT INTO PlayerGameStats (GameID, PlayerID, TeamID, PassingAttempts, PassYards, PassingPercentage, InterceptionsThrown, Carries, RushingYards, Receptions, ReceptionYards, Fumbles, Touchdowns, Tackles, TacklesForLoss, Sacks, PassBreakUps, Interceptions, PlayerPerformanceGrade)
VALUES 
-- QB (PlayerID = 1)
 (3, 1, 1, 22, 180, 60.0, 0, 15, 140, 0, 0, 3, 3, 2, 2, 0.0, 0, 1, 79.3),
-- WR (PlayerID = 2)
 (3, 2, 1, 0, 0, 0.0, 0, 6, 120, 10, 0, 2, 0, 0, 0, 0.0, 0, 0, 85.6),
-- RB (PlayerID = 3)
 (3, 3, 1, 0, 0, 0.0, 1, 18, 140, 1, 0, 1, 4, 0, 1, 0.0, 0, 0, 72.8),
-- TE (PlayerID = 4)
 (3, 4, 1, 0, 0, 0.0, 0, 3, 60, 4, 0, 1, 0, 0, 0, 0.0, 0, 0, 68.0),
-- DE (PlayerID = 5)
 (3, 5, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 2, 1, 0, 1, 0.0, 0, 0, 77.2),
-- DT (PlayerID = 6)
 (3, 6, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0.0, 0, 0, 75.0),
-- LB (PlayerID = 7)
 (3, 7, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 4, 2, 1, 0, 0.0, 0, 0, 81.7),
-- CB (PlayerID = 8)
 (3, 8, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 2, 1, 0, 2, 0.0, 0, 2, 68.5),
-- S (PlayerID = 9)
 (3, 9, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 3, 1, 0, 0, 0.0, 1, 0, 74.2);
-- Game 4
INSERT INTO PlayerGameStats (GameID, PlayerID, TeamID, PassingAttempts, PassYards, PassingPercentage, InterceptionsThrown, Carries, RushingYards, Receptions, ReceptionYards, Fumbles, Touchdowns, Tackles, TacklesForLoss, Sacks, PassBreakUps, Interceptions, PlayerPerformanceGrade)
VALUES 
-- QB (PlayerID = 1)
 (4, 1, 1, 30, 250, 70.2, 0, 18, 80, 0, 0, 2, 6, 2, 1, 0.0, 0, 1, 94.7),
-- WR (PlayerID = 2)
 (4, 2, 1, 0, 0, 0.0, 0, 8, 100, 5, 0, 1, 1, 0, 0, 0.0, 1, 0, 76.2),
-- RB (PlayerID = 3)
 (4, 3, 1, 0, 0, 0.0, 0, 10, 80, 2, 0, 2, 2, 0, 1, 0.0, 0, 1, 78.5),
-- TE (PlayerID = 4)
 (4, 4, 1, 0, 0, 0.0, 0, 2, 30, 2, 0, 1, 0, 0, 0, 0.0, 0, 0, 62.5),
-- DE (PlayerID = 5)
 (4, 5, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 3, 1, 0, 1, 0.0, 0, 0, 79.3),
-- DT (PlayerID = 6)
 (4, 6, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0.0, 0, 0, 74.0),
-- LB (PlayerID = 7)
 (4, 7, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 5, 2, 1, 0, 0.0, 0, 0, 80.8),
-- CB (PlayerID = 8)
 (4, 8, 1, 0, 0, 0.0, 1, 0, 0, 0, 0, 3, 0, 0, 2, 0.0, 1, 0, 69.8),
-- S (PlayerID = 9)
 (4, 9, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 4, 1, 0, 0, 0.0, 1, 0, 75.6);
-- Game 5
INSERT INTO PlayerGameStats (GameID, PlayerID, TeamID, PassingAttempts, PassYards, PassingPercentage, InterceptionsThrown, Carries, RushingYards, Receptions, ReceptionYards, Fumbles, Touchdowns, Tackles, TacklesForLoss, Sacks, PassBreakUps, Interceptions, PlayerPerformanceGrade)
VALUES 
-- QB (PlayerID = 1)
 (5, 1, 1, 18, 280, 75.6, 0, 12, 120, 0, 0, 2, 5, 1, 0, 0.0, 2, 0, 92.4),
-- WR (PlayerID = 2)
 (5, 2, 1, 0, 0, 0.0, 0, 6, 90, 7, 0, 1, 1, 0, 0, 0.0, 0, 1, 81.5),
-- RB (PlayerID = 3)
 (5, 3, 1, 0, 0, 0.0, 0, 15, 110, 3, 0, 1, 3, 1, 0, 0.0, 0, 1, 85.3),
-- TE (PlayerID = 4)
 (5, 4, 1, 0, 0, 0.0, 0, 3, 40, 5, 0, 1, 0, 0, 0, 0.0, 0, 0, 70.8),
-- DE (PlayerID = 5)
 (5, 5, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 2, 1, 0, 1, 0.0, 0, 0, 77.9),
-- DT (PlayerID = 6)
 (5, 6, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0.0, 0, 0, 75.5),
-- LB (PlayerID = 7)
 (5, 7, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 4, 2, 1, 0, 0.0, 0, 0, 80.2),
-- CB (PlayerID = 8)
 (5, 8, 1, 0, 0, 0.0, 1, 0, 0, 0, 0, 3, 0, 0, 2, 0.0, 0, 2, 72.5),
-- S (PlayerID = 9)
 (5, 9, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 3, 1, 0, 0, 0.0, 1, 0, 78.7);
-- Game 6
INSERT INTO PlayerGameStats (GameID, PlayerID, TeamID, PassingAttempts, PassYards, PassingPercentage, InterceptionsThrown, Carries, RushingYards, Receptions, ReceptionYards, Fumbles, Touchdowns, Tackles, TacklesForLoss, Sacks, PassBreakUps, Interceptions, PlayerPerformanceGrade)
VALUES 
-- QB (PlayerID = 1)
 (6, 1, 1, 25, 240, 68.0, 0, 14, 100, 0, 0, 2, 4, 1, 1, 0.0, 1, 0, 89.2),
-- WR (PlayerID = 2)
 (6, 2, 1, 0, 0, 0.0, 0, 5, 70, 9, 0, 1, 1, 0, 0, 0.0, 1, 0, 74.5),
-- RB (PlayerID = 3)
 (6, 3, 1, 0, 0, 0.0, 0, 12, 90, 4, 0, 1, 2, 1, 0, 0.0, 0, 0, 80.6),
-- TE (PlayerID = 4)
 (6, 4, 1, 0, 0, 0.0, 0, 2, 30, 3, 0, 1, 0, 0, 0, 0.0, 0, 0, 68.0),
-- DE (PlayerID = 5)
 (6, 5, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 2, 1, 0, 1, 0.0, 0, 0, 76.5),
-- DT (PlayerID = 6)
 (6, 6, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0.0, 0, 0, 72.0),
-- LB (PlayerID = 7)
 (6, 7, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 5, 2, 1, 0, 0.0, 0, 0, 82.0),
-- CB (PlayerID = 8)
 (6, 8, 1, 0, 0, 0.0, 1, 0, 0, 0, 0, 3, 0, 0, 2, 0.0, 0, 2, 70.8),
-- S (PlayerID = 9)
 (6, 9, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 4, 1, 0, 0, 0.0, 1, 0, 75.2);
-- Game 7
INSERT INTO PlayerGameStats (GameID, PlayerID, TeamID, PassingAttempts, PassYards, PassingPercentage, InterceptionsThrown, Carries, RushingYards, Receptions, ReceptionYards, Fumbles, Touchdowns, Tackles, TacklesForLoss, Sacks, PassBreakUps, Interceptions, PlayerPerformanceGrade)
VALUES 
-- QB (PlayerID = 1)
 (7, 1, 1, 28, 300, 72.8, 1, 16, 120, 0, 0, 3, 5, 2, 1, 0.0, 0, 1, 91.3),
-- WR (PlayerID = 2)
 (7, 2, 1, 0, 0, 0.0, 0, 7, 80, 8, 0, 2, 1, 0, 0, 0.0, 1, 0, 78.5),
-- RB (PlayerID = 3)
 (7, 3, 1, 0, 0, 0.0, 0, 14, 130, 2, 0, 2, 3, 0, 0, 0.0, 0, 1, 83.7),
-- TE (PlayerID = 4)
 (7, 4, 1, 0, 0, 0.0, 0, 4, 50, 3, 0, 1, 0, 0, 0, 0.0, 0, 0, 72.5),
-- DE (PlayerID = 5)
 (7, 5, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 2, 1, 0, 1, 0.0, 0, 0, 75.8),
-- DT (PlayerID = 6)
 (7, 6, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0.0, 0, 0, 71.0),
-- LB (PlayerID = 7)
 (7, 7, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 4, 2, 1, 0, 0.0, 0, 0, 80.0),
-- CB (PlayerID = 8)
 (7, 8, 1, 0, 0, 0.0, 1, 0, 0, 0, 0, 3, 0, 0, 2, 0.0, 0, 2, 69.2),
-- S (PlayerID = 9)
 (7, 9, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 3, 1, 0, 0, 0.0, 1, 0, 76.3);
-- Game 8
INSERT INTO PlayerGameStats (GameID, PlayerID, TeamID, PassingAttempts, PassYards, PassingPercentage, InterceptionsThrown, Carries, RushingYards, Receptions, ReceptionYards, Fumbles, Touchdowns, Tackles, TacklesForLoss, Sacks, PassBreakUps, Interceptions, PlayerPerformanceGrade)
VALUES 
-- QB (PlayerID = 1)
 (8, 1, 1, 26, 260, 70.5, 0, 14, 90, 0, 0, 2, 4, 1, 0, 0.0, 1, 0, 88.2),
-- WR (PlayerID = 2)
 (8, 2, 1, 0, 0, 0.0, 0, 8, 120, 6, 0, 1, 1, 0, 0, 0.0, 0, 1, 77.8),
-- RB (PlayerID = 3)
 (8, 3, 1, 0, 0, 0.0, 1, 15, 110, 2, 0, 1, 2, 1, 0, 0.0, 0, 1, 82.5),
-- TE (PlayerID = 4)
 (8, 4, 1, 0, 0, 0.0, 0, 3, 40, 5, 0, 1, 0, 0, 0, 0.0, 0, 0, 71.5),
-- DE (PlayerID = 5)
 (8, 5, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 3, 1, 0, 1, 0.0, 0, 0, 78.9),
-- DT (PlayerID = 6)
 (8, 6, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0.0, 0, 0, 74.0),
-- LB (PlayerID = 7)
 (8, 7, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 6, 2, 1, 0, 0.0, 0, 0, 81.0),
-- CB (PlayerID = 8)
 (8, 8, 1, 0, 0, 0.0, 1, 0, 0, 0, 0, 2, 0, 0, 2, 0.0, 0, 2, 68.0),
-- S (PlayerID = 9)
 (8, 9, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 4, 1, 0, 0, 0.0, 1, 0, 75.0);
-- Game 9
INSERT INTO PlayerGameStats (GameID, PlayerID, TeamID, PassingAttempts, PassYards, PassingPercentage, InterceptionsThrown, Carries, RushingYards, Receptions, ReceptionYards, Fumbles, Touchdowns, Tackles, TacklesForLoss, Sacks, PassBreakUps, Interceptions, PlayerPerformanceGrade)
VALUES 
-- QB (PlayerID = 1)
 (9, 1, 1, 30, 280, 74.0, 0, 15, 110, 0, 0, 2, 4, 1, 1, 0.0, 1, 0, 89.8),
-- WR (PlayerID = 2)
 (9, 2, 1, 0, 0, 0.0, 0, 6, 80, 8, 0, 1, 1, 0, 0, 0.0, 0, 1, 78.2),
-- RB (PlayerID = 3)
 (9, 3, 1, 0, 0, 0.0, 0, 13, 120, 2, 0, 2, 3, 1, 0, 0.0, 0, 1, 84.5),
-- TE (PlayerID = 4)
 (9, 4, 1, 0, 0, 0.0, 0, 4, 50, 3, 0, 1, 0, 0, 0, 0.0, 0, 0, 72.8),
-- DE (PlayerID = 5)
 (9, 5, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 2, 1, 0, 1, 0.0, 0, 0, 76.2),
-- DT (PlayerID = 6)
 (9, 6, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0.0, 0, 0, 71.5),
-- LB (PlayerID = 7)
 (9, 7, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 5, 2, 1, 0, 0.0, 0, 0, 80.5),
-- CB (PlayerID = 8)
 (9, 8, 1, 0, 0, 0.0, 1, 0, 0, 0, 0, 3, 0, 0, 2, 0.0, 0, 2, 69.5),
-- S (PlayerID = 9)
 (9, 9, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 3, 1, 0, 0, 0.0, 1, 0, 76.8);
-- Game 10
INSERT INTO PlayerGameStats (GameID, PlayerID, TeamID, PassingAttempts, PassYards, PassingPercentage, InterceptionsThrown, Carries, RushingYards, Receptions, ReceptionYards, Fumbles, Touchdowns, Tackles, TacklesForLoss, Sacks, PassBreakUps, Interceptions, PlayerPerformanceGrade)
VALUES 
-- QB (PlayerID = 1)
 (10, 1, 1, 24, 260, 71.2, 1, 13, 100, 0, 0, 2, 4, 1, 0, 0.0, 1, 0, 88.5),
-- WR (PlayerID = 2)
 (10, 2, 1, 0, 0, 0.0, 0, 7, 80, 8, 0, 2, 1, 0, 0, 0.0, 1, 0, 77.0),
-- RB (PlayerID = 3)
 (10, 3, 1, 0, 0, 0.0, 0, 16, 120, 3, 0, 1, 2, 1, 0, 0.0, 0, 1, 82.0),
-- TE (PlayerID = 4)
 (10, 4, 1, 0, 0, 0.0, 0, 3, 40, 4, 0, 1, 0, 0, 0, 0.0, 0, 0, 70.2),
-- DE (PlayerID = 5)
 (10, 5, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 3, 1, 0, 1, 0.0, 0, 0, 78.0),
-- DT (PlayerID = 6)
 (10, 6, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0.0, 0, 0, 73.5),
-- LB (PlayerID = 7)
 (10, 7, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 4, 2, 1, 0, 0.0, 0, 0, 80.8),
-- CB (PlayerID = 8)
 (10, 8, 1, 0, 0, 0.0, 1, 0, 0, 0, 0, 2, 0, 0, 2, 0.0, 0, 2, 68.8),
-- S (PlayerID = 9)
 (10, 9, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 3, 1, 0, 0, 0.0, 1, 0, 75.5);
-- Game 11
INSERT INTO PlayerGameStats (GameID, PlayerID, TeamID, PassingAttempts, PassYards, PassingPercentage, InterceptionsThrown, Carries, RushingYards, Receptions, ReceptionYards, Fumbles, Touchdowns, Tackles, TacklesForLoss, Sacks, PassBreakUps, Interceptions, PlayerPerformanceGrade)
VALUES 
-- QB (PlayerID = 1)
 (11, 1, 1, 32, 310, 75.6, 0, 18, 120, 0, 0, 3, 5, 2, 1, 0.0, 0, 1, 90.5),
-- WR (PlayerID = 2)
 (11, 2, 1, 0, 0, 0.0, 0, 5, 80, 9, 0, 2, 1, 0, 0, 0.0, 1, 0, 78.9),
-- RB (PlayerID = 3)
 (11, 3, 1, 0, 0, 0.0, 0, 14, 130, 2, 0, 2, 3, 0, 0, 0.0, 0, 1, 83.2),
-- TE (PlayerID = 4)
 (11, 4, 1, 0, 0, 0.0, 0, 4, 50, 3, 0, 1, 0, 0, 0, 0.0, 0, 0, 72.0),
-- DE (PlayerID = 5)
 (11, 5, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 2, 1, 0, 1, 0.0, 0, 0, 76.8),
-- DT (PlayerID = 6)
 (11, 6, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0.0, 0, 0, 71.8),
-- LB (PlayerID = 7)
 (11, 7, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 5, 2, 1, 0, 0.0, 0, 0, 80.2),
-- CB (PlayerID = 8)
 (11, 8, 1, 0, 0, 0.0, 1, 0, 0, 0, 0, 3, 0, 0, 2, 0.0, 0, 2, 69.0),
-- S (PlayerID = 9)
 (11, 9, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 3, 1, 0, 0, 0.0, 1, 0, 76.0);
-- Game 12
INSERT INTO PlayerGameStats (GameID, PlayerID, TeamID, PassingAttempts, PassYards, PassingPercentage, InterceptionsThrown, Carries, RushingYards, Receptions, ReceptionYards, Fumbles, Touchdowns, Tackles, TacklesForLoss, Sacks, PassBreakUps, Interceptions, PlayerPerformanceGrade)
VALUES 
-- QB (PlayerID = 1)
 (12, 1, 1, 28, 290, 73.8, 1, 15, 110, 0, 0, 2, 4, 1, 0, 0.0, 1, 0, 88.8),
-- WR (PlayerID = 2)
 (12, 2, 1, 0, 0, 0.0, 0, 7, 90, 7, 0, 2, 1, 0, 0, 0.0, 0, 1, 77.5),
-- RB (PlayerID = 3)
 (12, 3, 1, 0, 0, 0.0, 0, 17, 130, 2, 0, 1, 2, 1, 0, 0.0, 0, 1, 82.8),
-- TE (PlayerID = 4)
 (12, 4, 1, 0, 0, 0.0, 0, 3, 40, 4, 0, 1, 0, 0, 0, 0.0, 0, 0, 71.8),
-- DE (PlayerID = 5)
 (12, 5, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 3, 1, 0, 1, 0.0, 0, 0, 78.5),
-- DT (PlayerID = 6)
 (12, 6, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0.0, 0, 0, 73.2),
-- LB (PlayerID = 7)
 (12, 7, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 4, 2, 1, 0, 0.0, 0, 0, 81.2),
-- CB (PlayerID = 8)
 (12, 8, 1, 0, 0, 0.0, 1, 0, 0, 0, 0, 2, 0, 0, 2, 0.0, 0, 2, 68.5),
-- S (PlayerID = 9)
 (12, 9, 1, 0, 0, 0.0, 0, 0, 0, 0, 0, 3, 1, 0, 0, 0.0, 1, 0, 75.8);