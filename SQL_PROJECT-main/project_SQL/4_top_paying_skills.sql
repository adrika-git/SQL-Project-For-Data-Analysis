SELECT 
    skills,
    ROUND (AVG (top_paying_jobs.salary_year_avg),0) AS avg_salary
FROM 
    job_postings_fact AS top_paying_jobs 
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    top_paying_jobs.job_title_short = 'Data Analyst'  AND
    top_paying_jobs.salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;