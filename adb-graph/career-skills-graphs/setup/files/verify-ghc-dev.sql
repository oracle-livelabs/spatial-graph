-- Run as GHC_DEV in Database Actions SQL Worksheet.
-- Capability labels and role names can vary by Autonomous AI Database release.

SELECT USER AS connected_user,
       SYS_CONTEXT('USERENV', 'DB_NAME') AS database_name
FROM   dual;

SELECT granted_role
FROM   user_role_privs
ORDER BY granted_role;

SELECT privilege
FROM   session_privs
WHERE  privilege IN (
         'CREATE SESSION',
         'CREATE PROPERTY GRAPH',
         'CREATE ANY PROPERTY GRAPH',
         'READ ANY PROPERTY GRAPH'
       )
ORDER BY privilege;

SELECT owner,
       table_name AS object_name,
       privilege
FROM   user_tab_privs_recd
WHERE  UPPER(table_name) = 'DBMS_CLOUD_AI'
ORDER BY object_name, privilege;

SELECT profile_name,
       status
FROM   user_cloud_ai_profiles
ORDER BY profile_name;
