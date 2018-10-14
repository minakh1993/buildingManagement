package com.websystique.springmvc.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;

@Service("employeeService")
@Transactional
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeDao dao;
	
	public Employee findById(String username) {
		return dao.findById(username);
	}

	public void saveEmployee(Employee employee) {
		dao.saveEmployee(employee);


	}

	/*
	 * Since the method is running with Transaction, No need to call hibernate update explicitly.
	 * Just fetch the entity from db and update it with proper values within transaction.
	 * It will be updated in db once transaction ends. 
	 */
	public void updateEmployee(Employee employee) {
		Employee entity = dao.findById(employee.getUsername());
		if(entity!=null){
			entity.setName(employee.getName());
			entity.setFamily(employee.getFamily());
			entity.setEmail(employee.getEmail());
			entity.setPassword(employee.getPassword());
			entity.setPosition(employee.getPosition());
			entity.setRole(employee.getRole());


		}
	}

	public void deleteEmployeeByUsername(String username) {
		dao.deleteEmployee(username);
	}
	
	public List<Employee> findAllEmployees() {
		return dao.findAllEmployees();
	}

	public Set<Employee> findEmployeesByFamily(String text) {
		return dao.findEmployeesByFamily(text);
	}


}
