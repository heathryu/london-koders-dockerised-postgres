# SQL exercises

## Warm up

1. Display average number of tenures in months
```sql
SELECT AVG(tenure_in_months) FROM work_experiences;
```

2. Display names of all koders whose nationality is not South Korea
```sql
SELECT name FROM koders WHERE nationality != 'South Korea';
```

3. Display names and types of all furry friends
```sql
SELECT name, type FROM furry_friends;
```


## Exercise for `GROUP BY`

1. Display distinct nationalities and number of koders for each nationality
```sql
SELECT nationality, count(*)
FROM koders
GROUP BY nationality;
```

2. Display total number of tenures in months for each location (we don't care about which koders have worked here)
```sql
SELECT location, SUM(tenure_in_months)
FROM work_experiences
GROUP BY location;
```

3. Display the type and total number for each type of furry friends
```sql
SELECT type, COUNT(*)
FROM furry_friends
GROUP BY type;
```

4. Display distinct nationality & gender pairs from koders and the number of each pair
```sql
SELECT nationality, gender, count(*)
FROM koders
GROUP BY nationality, gender;
```

## Exercise for `JOIN`

1. Display koder's name, company name, location, tenure in months ordered by ascending order of tenure in months
```sql
SELECT name, company_name, location, tenure_in_months
FROM koders
JOIN work_experiences ON koders.id = work_experiences.koder_id
ORDER BY tenure_in_months;
```

2. Display koder's name, furry friend's name, furry friend's type (include koders who do not have furry friends also)
```sql
SELECT k.name, ff.name, ff.type
FROM koders k
LEFT JOIN furry_friends ff ON k.id = ff.koder_id;
```

3. Display names of companies that had ever employed a koder whose name contains 'h' (Remove duplicates)
```sql
SELECT DISTINCT(we.company_name)
FROM work_experiences we JOIN koders k on k.id = we.koder_id
WHERE k.name ILIKE '%h%';
```

4. Display names and types of furry friends whose koder have ever worked in South Korea
```sql
SELECT ff.name, ff.type
FROM furry_friends ff
    JOIN koders k ON k.id = ff.koder_id
    JOIN work_experiences we ON we.koder_id = k.id
WHERE we.location = 'South Korea';
```

5. Display the name of koder, the company name and tenure in YEARS for any work experience that persisted for at least 3 years
```sql
SELECT k.name, we.company_name, we.tenure_in_months / 12 AS years
FROM work_experiences we JOIN koders k ON k.id = we.koder_id
WHERE we.tenure_in_months / 12 >= 3;
```


## Exercise for `JOIN` + `GROUP BY`

1.  Display name and total number of tenures in YEARS for each koder in descending order of tenure
```sql
SELECT k.name,  SUM(we.tenure_in_months) / 12 AS years
FROM work_experiences we JOIN koders k ON k.id = we.koder_id
GROUP BY k.name
ORDER BY SUM(we.tenure_in_months) DESC;
```

2. For any koders who have cats, display the koders' name and the number of cats they serve
```sql
SELECT k.name, count(*)
FROM koders k JOIN furry_friends f ON f.koder_id = k.id
WHERE f.type = '🐱'
GROUP BY k.name;
```

3. Display each koder's name and number of furry friends they have in descending order of number of furry friends (must also include koders who do not have any furry friends)
```sql
SELECT k.name, count(f.*)
FROM koders k LEFT JOIN furry_friends f ON f.koder_id = k.id
GROUP BY k.name
ORDER BY count(f.*) DESC;
```

4. Display names of koders who have work experience from more than 2 companies
```sql
SELECT k.name
FROM koders k JOIN work_experiences we ON k.id = we.koder_id
GROUP BY k.name
HAVING COUNT(*) > 2;
```
