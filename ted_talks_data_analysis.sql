/* Finding the most popular TED talks */
SELECT *
FROM talks
ORDER BY "views" DESC LIMIT 10;

SELECT *
FROM talks
ORDER BY "likes" DESC LIMIT 10;


-- Finding the most popular TED talks Speaker (in terms of number of talks)
SELECT  author, COUNT(title) as "# talks"
FROM talks
GROUP BY author
ORDER BY COUNT(title) DESc
LIMIT 10;

-- Month-wise Analysis of TED talk frequency
SELECT  
    TO_DATE("date",'Month YYYY'),
    AVG("views"),
    AVG("likes")
FROM talks
GROUP BY TO_DATE("date",'Month YYYY')
ORDER BY EXTRACT (YEAR FROM TO_DATE("date",'Month YYYY') ) DESC


-- Year-wise Analysis of TED talk frequency
SELECT 
    EXTRACT (YEAR FROM TO_DATE("date",'Month YYYY') ) AS "year",
    AVG("views"),
    AVG("likes")
FROM talks
GROUP BY EXTRACT (YEAR FROM TO_DATE("date",'Month YYYY') )
ORDER BY "year" DESC


-- Finding TED talks of your favorite Author
SELECT author FROM talks WHERE "author" LIKE 'Pedro%';


-- Finding TED talks with the best view to like ration
SELECT 
    title, 
    author, 
    "views", 
    likes, 
    "views"/"likes" AS "views/likes ratio" 
FROM talks
ORDER BY "views"/"likes" desc;


-- Finding TED talks based on tags(like climate)
SELECT * FROM talks WHERE title LIKE '%climate%'


-- Finding the most popular TED talks Speaker (in terms of number of views)
SELECT author, MAX("views") FROM talks GROUP BY author ORDER BY MAX("views") DESC LIMIT 1;
