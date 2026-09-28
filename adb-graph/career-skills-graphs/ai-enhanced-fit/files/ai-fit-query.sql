-- Part 1: native vector-distance example.
-- The vectors are illustrative; the instructor's schema should contain
-- model-generated embeddings for the production workflow.

WITH candidate_skills (skill_name, skill_embedding) AS (
    SELECT 'SQL analytics',       TO_VECTOR('[0.96, 0.12, 0.01]') FROM dual UNION ALL
    SELECT 'data storytelling',  TO_VECTOR('[0.72, 0.61, 0.04]') FROM dual UNION ALL
    SELECT 'REST integration',   TO_VECTOR('[0.15, 0.08, 0.98]') FROM dual UNION ALL
    SELECT 'team mentoring',     TO_VECTOR('[0.54, 0.86, 0.09]') FROM dual
), profile_vector AS (
    SELECT TO_VECTOR('[0.90, 0.18, 0.02]') AS embedding
    FROM dual
)
SELECT c.skill_name,
       ROUND(VECTOR_DISTANCE(c.skill_embedding, p.embedding, COSINE), 4) AS distance
FROM   candidate_skills c
       CROSS JOIN profile_vector p
ORDER BY distance
FETCH FIRST 3 ROWS ONLY;

-- Part 2: verify the configured profile.

SELECT profile_name,
       status
FROM   user_cloud_ai_profiles
WHERE  UPPER(profile_name) = 'GHC_CAREER_AI';

-- Part 3: optional AI explanation.
-- Run only when the instructor has configured GHC_CAREER_AI and provider access.
-- Replace the role and evidence with the results from Lab 2.

SELECT DBMS_CLOUD_AI.GENERATE(
         prompt       => q'[
Using only the evidence below, explain whether the candidate has a plausible
path toward the target role. Return: (1) two evidence-based fit reasons,
(2) two skills to strengthen, and (3) one next action. Do not invent
credentials, employers, or experience.

Target role: Data Platform Engineer
Observed skills: SQL analytics; Python data pipelines; REST integration
Graph path evidence: skill -> data integration -> data platform engineer
Vector evidence: SQL analytics is the closest semantic match.
]',
         profile_name => 'GHC_CAREER_AI',
         action       => 'chat'
       ) AS explanation
FROM dual;
