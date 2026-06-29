SELECT 
    skills,
    top_paying_jobs.job_work_from_home,
    count(skills_job_dim.job_id) AS demand_count
FROM 
    job_postings_fact AS top_paying_jobs 
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    top_paying_jobs.job_title_short = 'Data Analyst' AND
    top_paying_jobs.job_work_from_home = TRUE
GROUP BY
    skills,
    top_paying_jobs.job_work_from_home
ORDER BY
    demand_count DESC
LIMIT 5;