package com.dishclass.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.classic.Session;

import com.product.model.ProductVO;

import hibernate.util.HibernateUtil;

public class DishClassDAO implements DishClassDAO_interface {
	
	@Override
	public DishClassVO getOneClass(Integer class_id) {
		
		DishClassVO dishClassVO = new DishClassVO();

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			dishClassVO=(DishClassVO) session.get(DishClassVO.class, class_id);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return dishClassVO;
	}
	
	@Override
	public List<DishClassVO> getAllDishClass() {
		List<DishClassVO> dishClassVOs = new LinkedList<DishClassVO>();

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("FROM DishClassVO ORDER BY class_id");
			dishClassVOs=query.list();
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return dishClassVOs;

	}
		
	public static void main(String[] args) {
		DishClassDAO dao=new DishClassDAO();
		
		DishClassVO classVO=dao.getOneClass(30);
		
		System.out.println(classVO.getClass_id());
		System.out.println(classVO.getClass_name());
		
		List<DishClassVO> list=dao.getAllDishClass();
		
		for(DishClassVO VOs :list){
			System.out.println(VOs.getClass_id());
			System.out.println(VOs.getClass_name());
		}

	}

}
