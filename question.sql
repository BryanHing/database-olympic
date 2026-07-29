#Part3


#Level 1: Basic SQL Queries

#1
--Question: Which participants were born before 1990?
--Purpose: This query helps identify participants who were active in the Olympics and are now older than 30, which could be useful for analyzing the age demographics of athletes.
SELECT FirstName, LastName, DateOfBirth 
FROM Participant 
WHERE DateOfBirth < '1990-01-01';

#2
--Question: List all events held in Tokyo during the 2020 Olympic Games.
--Purpose: This query retrieves all events that took place in Tokyo in 2020, allowing for focused analysis on that particular Olympic Games.
SELECT EventName, Sport 
FROM Event 
WHERE GameID = (SELECT GameID FROM Games WHERE Year = 2020 AND City = 'Tokyo');

#3
--Question: Find the participants whose first name starts with the letter 'S'.
--Purpose: This could be useful for profiling specific athletes, perhaps for promotional activities or statistical analyses based on name patterns.
SELECT FirstName, LastName 
FROM Participant 
WHERE FirstName LIKE 'S%';

#4
--Question: Show the total number of medals won in each event.
--Purpose: This provides insights into the popularity and competitiveness of each event based on medal distribution.
SELECT EventID, COUNT(MedalID) AS TotalMedals 
FROM Medal 
GROUP BY EventID;

#5
--Question: List participants and their corresponding age.
--Purpose: Understanding the age distribution of participants can help in evaluating trends and patterns in athlete performance over the years.
SELECT FirstName, LastName, YEAR(CURDATE()) - YEAR(DateOfBirth) AS Age 
FROM Participant;

#6
--Question: Find the participant who achieved the fastest time in a track event.
--Purpose: This query identifies the top-performing athlete in track events, useful for performance analysis and highlighting top athletes.
SELECT FirstName, LastName, Result 
FROM Participant 
JOIN Participation ON Participant.ParticipantID = Participation.ParticipantID
JOIN Event ON Participation.EventID = Event.EventID
WHERE Event.Sport = 'Athletics' AND Event.Discipline = 'Track' 
ORDER BY Result ASC LIMIT 1;

#Level 2: Advanced SQL Queries

#1
--Question: Find which countries have won the most gold medals.
--Purpose: This analysis helps identify leading nations in terms of Olympic success and could influence funding and support for sports programs.
SELECT Country.CountryName, COUNT(MedalID) AS GoldMedals
FROM Medal
JOIN Participant ON Medal.ParticipantID = Participant.ParticipantID
JOIN Country ON Participant.CountryCode = Country.CountryCode
WHERE MedalType = 'Gold'
GROUP BY Country.CountryName
ORDER BY GoldMedals DESC;

#2
--Question: List the top 3 participants with the most medals.
--Purpose: This highlights the most decorated athletes in your dataset, providing insights into exceptional talent and consistency across events.
SELECT Participant.FirstName, Participant.LastName, COUNT(MedalID) AS TotalMedals
FROM Medal
JOIN Participant ON Medal.ParticipantID = Participant.ParticipantID
GROUP BY Participant.ParticipantID
ORDER BY TotalMedals DESC
LIMIT 3;

#3
--Question: Find all the events where teams from the USA participated.
--Purpose: This query can help analyze the performance and representation of the USA in different sports, useful for national sports strategies.
SELECT Event.EventName, Team.TeamName
FROM Participation
JOIN Event ON Participation.EventID = Event.EventID
JOIN Team ON Participation.TeamID = Team.TeamID
WHERE Team.CountryCode = 'USA';

#4
--Question: Show the average position achieved by participants in each event.
--Purpose: This can provide insights into the competitive nature of each event, showing how closely matched the participants are in performance.
SELECT Event.EventName, AVG(Participation.Position) AS AvgPosition
FROM Participation
JOIN Event ON Participation.EventID = Event.EventID
GROUP BY Event.EventName;

#5
--Question:Which sports have the highest average count of gold medals awarded per event?
--Purpose:This query helps identify the sports with the highest success rate for gold medals, indicating dominance or excellence in those specific sports.
SELECT Event.Sport, AVG(GoldCount) AS AverageGolds
FROM (
    SELECT EventID, COUNT(MedalID) AS GoldCount
    FROM Medal
    WHERE MedalType = 'Gold'
    GROUP BY EventID
) AS GoldsPerEvent
JOIN Event ON GoldsPerEvent.EventID = Event.EventID
GROUP BY Event.Sport
ORDER BY AverageGolds DESC;

#6
--Question: Which country had the highest average medal count per event?
--Purpose: This query helps analyze the performance efficiency of countries by measuring how many medals they win on average for each event they participate in. This can provide insights into which countries are consistently successful in specific sports.
SELECT Country.CountryName, AVG(MedalCount) AS AvgMedalsPerEvent
FROM (
    SELECT Participant.CountryCode, Participation.EventID, COUNT(Medal.MedalID) AS MedalCount
    FROM Medal
    JOIN Participant ON Medal.ParticipantID = Participant.ParticipantID
    JOIN Participation ON Participant.ParticipantID = Participation.ParticipantID
    GROUP BY Participant.CountryCode, Participation.EventID
) AS EventMedals
JOIN Country ON EventMedals.CountryCode = Country.CountryCode
GROUP BY Country.CountryName
ORDER BY AvgMedalsPerEvent DESC
LIMIT 1;














