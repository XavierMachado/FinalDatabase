-- Create College table
CREATE TABLE College (
    TeamID INT PRIMARY KEY,
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

-- Insert data into College table
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
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);