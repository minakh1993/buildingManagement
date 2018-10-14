package com.websystique.springmvc.User;



import java.util.List;
import java.util.Set;

public interface EmployeeService {

	Employee findById(String username);
	
	void saveEmployee(Employee employee);
	
	void updateEmployee(Employee employee);
	
	void deleteEmployeeByUsername(String username);

	List<Employee> findAllEmployees();

	Set<Employee> findEmployeesByFamily(String text);
	



	
}
