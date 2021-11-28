USE college;
SELECT * FROM stem;

SELECT Major_category as "Major Category",
SUM(Total) as "Total"
FROM ages GROUP BY Major_category 
ORDER BY SUM(Total) DESC LIMIT 10; -- Top 10 of the most popualr majors in all students 

SELECT FOD1P, Major
FROM majors 
WHERE Major = ANY (SELECT Major 
FROM grad WHERE Grad_total > 20000)
LIMIT 5; -- Most popular major in graduate students above 20000

SELECT Major, Total * 100/ sub.sum_total'Percentage'
FROM recentgrads
CROSS JOIN 
(SELECT SUM(Total) sum_Total FROM recentgrads) sub; -- Percentage 

CREATE VIEW Result 
AS SELECT stem.Major_code, 
          majors.FOD1P,
          stem.Major, 
          stem.Total 
FROM stem, majors 
WHERE stem.Major = majors.Major
ORDER BY stem.Total DESC;
SELECT * FROM Result; -- Create view

SELECT MAJOR,MEN FROM recentgrads 
WHERE Major LIKE 'CO%'
ORDER BY MEN DESC ; -- Find the major 'CO%'

SELECT Major, WOMEN FROM recentgrads
WHERE Major LIKE 'A%'
ORDER BY WOMEN DESC; -- Find the major 'A%'

SELECT Major_code, Major, Major_category,
CASE 
	WHEN MEN > WOMEN THEN 'This major is famous for men'
	WHEN MEN = WOMEN THEN 'This major is famous for women'
    ELSE "This major is famous for women"
END AS MajorText
FROM stem
ORDER BY Total; -- Create the column for recommending majors to female and male

