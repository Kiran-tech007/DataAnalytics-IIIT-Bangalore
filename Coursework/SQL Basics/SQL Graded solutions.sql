alter table employee
add hno integer(5);

select * from employee;-- group by super_ssn;
update employee
set hno = substring_index(address,' ',1);

select  fname , 
rank() over(order by hno) as 'House Rank' from employee;

DELIMITER $$
create function  houseDiff12(empssn int(12))
  returns float(8,4)
  deterministic
  begin
  declare consthno int(6);
  declare deptno int(2);
   declare avg_diff float(8,4);
	select hno , dno into consthno,deptno
    from employee 
    where ssn = empssn;

  select  avg(abs(consthno - hno)) into avg_diff from employee where ssn != empssn and dno = deptno group by deptno;
  
  return avg_diff;
  end $$
DELIMITER ;

select dno, avg(abs(638 - hno)) as 'avg_diff' from employee where ssn != '333445555' group by dno ;
 
select houseDiff12(ssn) from employee where fname like 'Franklin%';

select * from employee where fname is not null and super_ssn is null ;

select * from employee;

select houseDiff7(hno) from employee where ssn != '123456789';


select  avg(abs(731 - hno)) as 'avg_diff' from employee where ssn != '123456789';


select fname , bdate from employee where ssn = (select super_ssn from employee where ssn = '666884444');

select year(curdate())-year(bdate) as age  from employee;

alter table employee
add age int(4);

update employee
set age = year(curdate())-year(bdate);

select super_ssn from employee where ssn = '666884444';

select fname , salary/age as 'Ratio' , rank() over(order by salary/age desc) as 'Rank' from employee;

select e.fname as 'Emp Name' , e.age as 'Employee Age' ,s.fname as 'Sup Name' ,s.age as 'Supervisor Age' , abs(e.age - s.age) as 'Difference' from employee e join employee s  on e.super_ssn = s.ssn and e.ssn = '987654321';

Use window function to rank the employees in order of salary/age (Salary divided by age) in descending order (Employee with greatest salary/age is ranked first and so forth). What is the Salary/Age of employee ranked fifth?