-- QUERY 1: Employees with a salary with more than 50k --
SELECT eid, ename, salary
FROM employee
WHERE salary > 50000;

-- OUTPUT --
+------+-------------------+--------+
| eid  | ename             | salary |
+------+-------------------+--------+
| 1001 | Pricilla_Ulysses  |  63164 |
| 1002 | Zara_Holt         |  99984 |
| 1007 | Carl_Thierry      |  78011 |
| 1008 | Theodore_Vernic   |  74450 |
| 1009 | Undine_Jaspers    | 104272 |
| 1010 | Stephanie_Abbott  |  73684 |
| 1011 | Xavier_Ilfit      |  95853 |
| 1013 | Oscar_Novits      |  84342 |
| 1015 | Denise_Fallion    |  60597 |
| 1017 | Elizabeth_Jaspers |  86292 |
| 1018 | Quinn_Novits      |  95704 |
| 1019 | Ingrid_Ollins     |  93728 |
| 1020 | Wendy_Peters      |  81477 |
| 1021 | Kasey_Thierry     |  62567 |
| 1022 | William_Mender    |  69834 |
| 1023 | Margaret_Lilliks  |  77626 |
| 1024 | Kasey_Vernic      |  77775 |
| 1025 | Bob_Espen         |  83147 |
+------+-------------------+--------+

-- QUERY 2: Employees that work in more than one department --
SELECT e.eid, e.ename, count(did)
FROM employee e
INNER JOIN works w ON e.eid = w.eid
GROUP BY e.eid
HAVING COUNT(did) > 1;

-- OUTPUT --
+------+-------------------+------------+
| eid  | ename             | count(did) |
+------+-------------------+------------+
| 1001 | Pricilla_Ulysses  |          2 |
| 1002 | Zara_Holt         |          2 |
| 1003 | Mitchell_Ulysses  |          2 |
| 1006 | Mitchell_Jaspers  |          2 |
| 1007 | Carl_Thierry      |          2 |
| 1009 | Undine_Jaspers    |          3 |
| 1012 | Lucille_Ollins    |          2 |
| 1013 | Oscar_Novits      |          3 |
| 1014 | Jeff_Espen        |          2 |
| 1016 | Umberto_Carmel    |          3 |
| 1017 | Elizabeth_Jaspers |          3 |
| 1018 | Quinn_Novits      |          2 |
| 1021 | Kasey_Thierry     |          3 |
| 1024 | Kasey_Vernic      |          2 |
| 1025 | Bob_Espen         |          3 |
+------+-------------------+------------+

-- QUERY 3: Managers that also work in a department that they do not manage --
SELECT department.manager_id, employee.ename
FROM department, employee
WHERE employee.eid = department.manager_id
HAVING department.manager_id NOT IN (
SELECT DISTINCT department.manager_id
FROM employee, works, department
WHERE employee.eid = works.eid AND department.did = works.did AND employee.eid = department.manager_id);

-- OUTPUT --
+------------+----------------+
| manager_id | ename          |
+------------+----------------+
|       1002 | Zara_Holt      |
|       1004 | Hayley_Ollins  |
|       1007 | Carl_Thierry   |
|       1015 | Denise_Fallion |
+------------+----------------+

-- QUERY 4: ID's of employees that work in department 203 or in department 302 --
-- Department numbers were changed to 2003 and 2004 as the implemented database has different did's --
SELECT eid, did
FROM works
WHERE did = 2003 OR did = 2004;

-- OUTPUT --
+------+------+
| eid  | did  |
+------+------+
| 1010 | 2003 |
| 1011 | 2003 |
| 1012 | 2003 |
| 1016 | 2003 |
| 1021 | 2003 |
| 1006 | 2004 |
| 1016 | 2004 |
| 1017 | 2004 |
| 1020 | 2004 |
| 1025 | 2004 |
+------+------+

-- QUERY 5: Employees that do not work in a department managed by John Doe --
-- Employee name changed to employee id in case that John Doe is not a generated employee --
SELECT DISTINCT employee.eid, ename
FROM employee, works, department
WHERE employee.eid = works.eid AND works.did = department.did
AND department.manager_id NOT IN (
SELECT eid
FROM employee
WHERE eid = 1011);

-- OUTPUT --
+------+-------------------+
| eid  | ename             |
+------+-------------------+
| 1007 | Carl_Thierry      |
| 1009 | Undine_Jaspers    |
| 1013 | Oscar_Novits      |
| 1015 | Denise_Fallion    |
| 1021 | Kasey_Thierry     |
| 1025 | Bob_Espen         |
| 1001 | Pricilla_Ulysses  |
| 1003 | Mitchell_Ulysses  |
| 1017 | Elizabeth_Jaspers |
| 1018 | Quinn_Novits      |
| 1024 | Kasey_Vernic      |
| 1010 | Stephanie_Abbott  |
| 1011 | Xavier_Ilfit      |
| 1012 | Lucille_Ollins    |
| 1016 | Umberto_Carmel    |
| 1002 | Zara_Holt         |
| 1006 | Mitchell_Jaspers  |
| 1014 | Jeff_Espen        |
| 1023 | Margaret_Lilliks  |
| 1004 | Hayley_Ollins     |
| 1005 | Beatrice_Xertz    |
| 1008 | Theodore_Vernic   |
| 1019 | Ingrid_Ollins     |
| 1022 | William_Mender    |
| 1020 | Wendy_Peters      |
+------+-------------------+
