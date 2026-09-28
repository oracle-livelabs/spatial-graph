-- Run as GHC_DEV after submitting a profile in the APEX application.
-- This query exposes the latest task results saved by the supplied app.

SELECT history_id,
       conversation_id,
       task_order,
       status,
       JSON_VALUE(
         result_payload,
         '$.sql' RETURNING VARCHAR2(4000) NULL ON ERROR
       ) AS graph_sql_preview,
       JSON_VALUE(
         result_payload,
         '$.occupations[0].title' RETURNING VARCHAR2(4000) NULL ON ERROR
       ) AS first_role
FROM   career_profile_task_history
ORDER BY history_id DESC
FETCH FIRST 12 ROWS ONLY;

-- Illustrative SQL Property Graph pattern.
-- Replace the graph name, labels, and property names with the values
-- supplied by the workshop instructor before executing this statement.

SELECT *
FROM GRAPH_TABLE (
  career_skills_graph
  MATCH
    (s IS skill)
      ((x) -[e IS connects_to]-> (y)){1,3}
    (r IS role)
  COLUMNS (
    s.skill_name AS starting_skill,
    r.role_name  AS target_role
  )
);
