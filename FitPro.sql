-- ============================================================================================================
--                                        FITPRO GYM SQL PROJECT
-- ============================================================================================================

-- 1. Retrieve the name and membership_type of female members
SELECT 
	name,
	membership_type
FROM 
	memberships m1
INNER JOIN 
	members m2
ON 
	m1.member_id = m2.member_id
WHERE
	gender = 'F'


-- 2. List members with a Quarterly membership aged between 20 and 30.
SELECT
	*
FROM 
	memberships
WHERE
	membership_type = 'Quaterly'
	AND
	age BETWEEN 20 AND 30;


-- 3. Count members by membership type
SELECT
	membership_type,
	COUNT(*) AS total_members
FROM 
	memberships
GROUP BY
	membership_type


-- 4. Calculate the average age of members, grouped by membership_type
SELECT
	membership_type,
	ROUND(AVG(age)) AS avg_age
FROM 
	memberships
GROUP BY
	membership_type


-- 5. Top 3 members with the highest visits
SELECT 
	member_id,
	COUNT(*) AS total_visits
FROM 
	visits
GROUP BY
	member_id
ORDER BY
	total_visits DESC
LIMIT 3;


-- 6. Members with more than 2 visits, sorted by total visits, top 5.
SELECT
	member_id,
	COUNT(*) AS total_visits
FROM 
	visits
GROUP BY
	member_id
HAVING 
	COUNT(*) > 2
ORDER BY
	total_visits DESC
LIMIT 5;


-- 7. Members who joined in 2023, grouped by membership type(having count>1).
SELECT
	membership_type,
	COUNT(*) AS total_members
FROM 
	memberships
WHERE
	EXTRACT(YEAR FROM join_date) = 2023
GROUP BY
	membership_type
HAVING COUNT(*) > 1;


-- 8. Active Monthly members grouped by membership_type, sorted by recent joint dates.
SELECT
	membership_type,
	MAX(join_date) AS most_recent_dates,
	COUNT(*) AS total_members
FROM 
	memberships
WHERE
	status = 'Active'
	AND
	membership_type = 'Monthly'
GROUP BY
	membership_type
ORDER BY
	most_recent_dates DESC;










