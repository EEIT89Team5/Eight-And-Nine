package com.dishclass.model;

import java.util.List;

public class DishClassService {

	private DishClassDAO_interface dao;
	
	public DishClassService(){
		this.dao=new DishClassDAO();
	}
	
	public DishClassVO getOneClass(Integer class_id){
		return dao.getOneClass(class_id);
	}
	
	public List<DishClassVO> getAllClasses(){
		
		return dao.getAllDishClass();
	}
	
	public static void main(String[] args) {
		
		DishClassService dao=new DishClassService();
		
		DishClassVO classVO=dao.getOneClass(30);
		
		System.out.println(classVO.getClass_id());
		System.out.println(classVO.getClass_name());
		
		List<DishClassVO> list=dao.getAllClasses();
		
		for(DishClassVO VOs :list){
			System.out.println(VOs.getClass_id());
			System.out.println(VOs.getClass_name());
		}

	}

}
