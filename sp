CREATE DEFINER=`root`@`localhost` PROCEDURE `EmployeeAddOrEdit`(
IN _EmpID INT,
In _Namee varchar(45),
IN _EmpCode varchar(45),
IN _Salary int
)
BEGIN
	IF _EmpID = 0 then
		insert into employee(Namee,EmpCode,Salary)
        values (_Namee,_EmpCode,_Salary);
        
        set _EmpID = last_insert_id();
	else
		UPDATE employee
		set
		Namee = _Namee,
		EmpCode = _EmpCode,
		Salary = _Salary
        WHERE EmpID = _EmpID;
	END if;
    
	select _EmpID AS 'EmpID';
END
