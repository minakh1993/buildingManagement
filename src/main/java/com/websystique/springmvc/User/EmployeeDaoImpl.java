package com.websystique.springmvc.User;

import com.websystique.springmvc.dao.AbstractDao;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Repository("employeeDao")
public class EmployeeDaoImpl extends AbstractDao<String, Employee> implements EmployeeDao {

	public Employee findById(String username) {
		Employee employee =getByKey(username);
		if(employee ==null){
			return new Employee();
		}else{
			return employee;
		}

	}

	public void saveEmployee(Employee employee) {
		persist(employee);
	}

	public void deleteEmployee(String username) {
		Query query = getSession().createSQLQuery("delete from Employee where username = :username");
		query.setString("username", username);
		query.executeUpdate();
	}


	public List<Employee> findAllEmployees() {
		Criteria criteria = createEntityCriteria();
		return (List<Employee>) criteria.list();
	}

	public Set<Employee> findEmployeesByFamily(String text) {

		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.like("family", "%"+text+"%"));
		List<Employee> list=(List<Employee>)criteria.list();
		Set<Employee> employees = new HashSet<Employee>() ;
		employees.addAll(list);

		return employees;


	}


}
