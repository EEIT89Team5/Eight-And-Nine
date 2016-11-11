package com.emp.model;

import java.sql.Date;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class EmpService {

	private EmpDAO_interface dao;

	public EmpService() {
		ApplicationContext context = new ClassPathXmlApplicationContext("model-config-JndiObjectFactoryBean.xml");
		dao =(EmpDAO_interface) context.getBean("empDAO");
	}

	public EmpVO addEmp(String emp_name, String emp_gender,String emp_title,String emp_fulltime, 
			Integer emp_salary,java.sql.Date emp_birthday,String emp_idnumber,String emp_phone,
			String emp_addr,java.sql.Date emp_hiredate,String emp_email,String emp_password,
			String emp_status) {

		EmpVO empVO = new EmpVO();

		empVO.setEmp_name(emp_name);
		empVO.setEmp_gender(emp_gender);
		empVO.setEmp_title(emp_title);
		empVO.setEmp_fulltime(emp_fulltime);
		empVO.setEmp_salary(emp_salary);
		empVO.setEmp_birthday(emp_birthday);
		empVO.setEmp_idnumber(emp_idnumber);
		empVO.setEmp_phone(emp_phone);
		empVO.setEmp_addr(emp_addr);
		empVO.setEmp_hiredate(emp_hiredate);
		empVO.setEmp_email(emp_email);
		empVO.setEmp_password(emp_password);
		empVO.setEmp_status(emp_status);
		
		dao.insert(empVO);

		return empVO;
	}

	public EmpVO updateEmp(Integer emp_id,String emp_name, String emp_gender,String emp_title,String emp_fulltime, 
			Integer emp_salary,java.sql.Date emp_birthday,String emp_idnumber,String emp_phone,
			String emp_addr,java.sql.Date emp_hiredate,String emp_email,String emp_password,
			String emp_status) {

		EmpVO empVO = new EmpVO();

		empVO.setEmp_id(emp_id);
		empVO.setEmp_name(emp_name);
		empVO.setEmp_gender(emp_gender);
		empVO.setEmp_title(emp_title);
		empVO.setEmp_fulltime(emp_fulltime);
		empVO.setEmp_salary(emp_salary);
		empVO.setEmp_birthday(emp_birthday);
		empVO.setEmp_idnumber(emp_idnumber);
		empVO.setEmp_phone(emp_phone);
		empVO.setEmp_addr(emp_addr);
		empVO.setEmp_hiredate(emp_hiredate);
		empVO.setEmp_email(emp_email);
		empVO.setEmp_password(emp_password);
		empVO.setEmp_status(emp_status);
		
		dao.update(empVO);

		return dao.findByPrimaryKey(emp_id);
	}

	public void deleteEmp(Integer emp_id) {
		dao.delete(emp_id);
	}

	public EmpVO getOneEmp(Integer emp_id) {
		return dao.findByPrimaryKey(emp_id);
	}

	public List<EmpVO> getAll() {
		return dao.getAll();
	}
}
