#Part 4


#1: Stored Procedures

--1a: Stored Procedure to Update Participant's Team Participation
--This stored procedure updates the team participation for a participant in a specific event.
DELIMITER //

CREATE PROCEDURE UpdateTeamParticipation (
    IN pParticipantID INT,
    IN pEventID INT,
    IN pNewTeamID INT
)
BEGIN
    -- Check if the Participant exists in the given event
    IF EXISTS (SELECT 1 FROM Participation WHERE ParticipantID = pParticipantID AND EventID = pEventID) THEN
        -- Update the TeamID in the Participation table
        UPDATE Participation
        SET TeamID = pNewTeamID
        WHERE ParticipantID = pParticipantID AND EventID = pEventID;
    ELSE
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'No participation record found for this Participant and Event.';
    END IF;
END //

DELIMITER ;
--Usage:
CALL UpdateTeamParticipation(1, 1, 12);  -- Update Usain Bolt's participation in event 1 to be part of Team 12


--1b: Stored Procedure to Get Medal Count by Country
--This stored procedure retrieves the total number of medals won by each country
DELIMITER //
CREATE PROCEDURE GetMedalCountByCountry (IN pCountryCode CHAR(3))
BEGIN
    SELECT C.CountryName, COUNT(M.MedalID) AS MedalCount
    FROM Medal M
    JOIN Participant P ON M.ParticipantID = P.ParticipantID
    JOIN Country C ON P.CountryCode = C.CountryCode
    WHERE C.CountryCode = pCountryCode
    GROUP BY C.CountryName;
END //
DELIMITER ;
--Usage:
CALL GetMedalCountByCountry('USA');


#2: Views

--2a: Medal Summary by Country
--Purpose: This view is useful to easily retrieve how many gold, silver, and bronze medals each country has won without having to write complex queries each time.
CREATE VIEW MedalSummaryByCountry AS
SELECT 
    c.CountryCode,
    c.CountryName,
    SUM(CASE WHEN m.MedalType = 'Gold' THEN 1 ELSE 0 END) AS TotalGoldMedals,
    SUM(CASE WHEN m.MedalType = 'Silver' THEN 1 ELSE 0 END) AS TotalSilverMedals,
    SUM(CASE WHEN m.MedalType = 'Bronze' THEN 1 ELSE 0 END) AS TotalBronzeMedals,
    COUNT(m.MedalID) AS TotalMedals
FROM 
    Country c
LEFT JOIN 
    Participant p ON c.CountryCode = p.CountryCode
LEFT JOIN 
    Medal m ON p.ParticipantID = m.ParticipantID
GROUP BY 
    c.CountryCode, c.CountryName;

--2b: Participation with No Medals
--Purpose: This view allows you to quickly find participants who have not won any medals. It can be useful for analyzing athletes' performances.
CREATE VIEW ParticipantsWithoutMedals AS
SELECT 
    p.ParticipantID,
    p.FirstName,
    p.LastName,
    p.CountryCode,
    c.CountryName
FROM 
    Participant p
LEFT JOIN 
    Medal m ON p.ParticipantID = m.ParticipantID
JOIN 
    Country c ON p.CountryCode = c.CountryCode
WHERE 
    m.MedalID IS NULL;


#3: Indexes

--3a: Index on CountryCode in the Participant Table
--Purpose: Speed up queries filtering by country.
CREATE INDEX idx_participant_country ON Participant (CountryCode);

--3b: Index on EventID in the Participation Table 
--Purpose: Enhance performance for queries accessing participation by event.
CREATE INDEX idx_participation_event ON Participation (EventID);
--Usage:
-- Retrieve all participants from Jamaica
SELECT * FROM Participant WHERE CountryCode = 'CHN';

-- Retrieve all participation records for a specific event
SELECT * FROM Participation WHERE EventID = 1;















