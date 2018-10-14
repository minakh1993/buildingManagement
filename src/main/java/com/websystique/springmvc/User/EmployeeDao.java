package com.websystique.springmvc.User;



import java.util.List;
import java.util.Set;

public interface EmployeeDao {

	Employee findById(String username);

	void saveEmployee(Employee employee);
	
	void deleteEmployee(String username);
	
	List<Employee> findAllEmployees();

	Set<Employee> findEmployeesByFamily(String text);



}
