SELECT 
  [ID], 
  [Name] AS 'Competitor Name' -- Renamed column
  , 
  CASE WHEN [Sex] = 'M' tHEN 'Male' ELSE 'Female' END AS Sex, 
  [Age], 
  CASE WHEN [Age] < 18 THEN 'UNDER 18' WHEN [Age] BETWEEN 18 
  AND 25 THEN '18-25' WHEN [Age] BETWEEN 25 
  AND 30 THEN '25-30' WHEN [Age] > 30 THEN 'OVER 30' END AS [Age Grouping], 
  [Height], 
  [Weight], 
  [NOC] AS 'Nation Code' --      ,CHARINDEX(' ', Games)-1 AS 'Example 1'
  --      ,CHARINDEX(' ', REVERSE(Games))-1 AS 'Example 2'
  , 
  LEFT(
    Games, 
    CHARINDEX(' ', Games) -1
  ) AS 'Year' -- split column to isolate Year, based on space
  --      ,RIGHT(Games,CHARINDEX(' ',REVERSE(Games))-1) 'AS Season' --Split column to isolate Season, based on space
  --      ,[Games]
  --      ,[City] -- Comment out as it is not necessary in the analysis
  , 
  [Sport], 
  [Event], 
  CASE WHEN Medal = 'Na' THEN 'Not Registed' ELSE Medal END AS Medal -- Replaced Na with Not Registered
FROM 
  [olympic_games].[dbo].[athletes_event_results] 
WHERE 
  RIGHT(
    Games, 
    CHARINDEX(
      ' ', 
      REVERSE(Games)
    )-1
  ) = 'Summer' -- where clause to isolate Summer Season
