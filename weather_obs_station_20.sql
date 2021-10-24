/*
Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to decimal places. 
*/

SET @rowindex := -1;
 
SELECT
   ROUND(AVG(LAT_N), 4)
FROM
   (SELECT 
        @rowindex:=@rowindex + 1 AS rowindex,
        LAT_N
    FROM 
        STATION
    ORDER BY 
        LAT_N) AS g
WHERE
    g.rowindex IN (FLOOR(@rowindex / 2) , CEIL(@rowindex / 2));
