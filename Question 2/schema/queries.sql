-- QUERY 1: Employees with a salary with more than 50k --
SELECT eid, ename
FROM employee
WHERE salary > 50000;

-- QUERY 2: Employees that work in more than one department --
SELECT employee.eid, count(did)
FROM employee e
INNER JOIN works w ON e.eid = w.eid
GROUP BY e.eid
HAVING COUNT(did) > 1;


-- QUERY 3: Managers that also work in a department that they do not manage --
SELECT manager_id, did
FROM department, works
WHERE NOT (department.did = works.did);


-- QUERY 4: ID's of employees that work in department 203 or in department 302 --
-- Department numbers were changed to 2003 and 2004 as the implemented database has different did's --
SELECT eid
FROM works
WHERE did = 2003 OR did = 2004;

-- QUERY 5: Employees that do not work in a department managed by John Doe --
-- Employee name changed to employee id in case that John Doe is not a generated employee --
SELECT works.eid
FROM department, works
WHERE NOT (manager_id = 1011);

	

