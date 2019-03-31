#175
select firstname, lastname,city, state
from person p left join
address a
on
p.personid=a.personid
#176
SELECT max(Salary) as SecondHighestSalary
FROM Employee
WHERE Salary < (SELECT max(Salary) FROM Employee)
#177
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  SET N = N - 1;
  RETURN (
      # Write your MySQL query statement below.
      SELECT (
          SELECT DISTINCT Salary FROM Employee
          ORDER BY Salary DESC
          LIMIT 1 OFFSET N
      ) AS getNthHighestSalary
  );
END
#178
#an @ sign to suggest user-defined variable
#:=is used as assignment operator like ==
SELECT
  Score,
  @rank := @rank + (@prev != (@prev := Score)) Rank
FROM
  Scores,
  (SELECT @rank := 0, @prev := -1) init
ORDER BY Score desc
#185
select d.name Department, e1.name Employee, e1.salary Salary
from department d
    join employee e1
    on d.id=e1.departmentid
where 3 > (select count( distinct e2.salary)
            from employee e2
            where e2.salary>e1.salary
                    and e1.departmentid=e2.departmentid
           )
#181
select e1.name Employee
from employee e1,employee e2
where e1.managerid=e2.id
and e1.salary>e2.salary
#595
select name, population, area
from world
where population > 25000000
or area > 3000000
#184
select d.name Department, e.name Employee,e.salary Salary
from employee e
    join department d
    on e.departmentid=d.id
where (e.departmentid, e.salary) in 
        (select 
                e1.departmentid,max(e1.salary)
         from 
                employee e1
         group by 
                departmentid)
#180
select distinct l1.num ConsecutiveNums
from 
     logs l1,
     logs l2,
     logs l3
where 
      l2.id=l1.id+1
      and l3.id=l2.id+1
      and l1.num=l2.num
      and l2.num=l3.num



