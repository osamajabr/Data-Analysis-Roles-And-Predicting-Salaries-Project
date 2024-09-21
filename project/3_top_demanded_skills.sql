/*
 Question: What are the most in-demand skills for remote data analysts roles?
 */

select
    skills,
    count(skills_job_dim.job_id) as demand_count
from job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
where
    job_title_short = 'Data Analyst'
and job_work_from_home = True
group by skills
order by demand_count desc
limit 5