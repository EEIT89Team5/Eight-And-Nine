package com.discount.model;

import java.util.List;
import org.hibernate.*;

import hibernate.util.HibernateUtil;

public class DiscountDAO implements DiscountDAO_interface{

	private static final String GET_ALL_STMT = "from DiscountVO";
	
	@Override
	public void insert(DiscountVO discountVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(discountVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void update(DiscountVO discountVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(discountVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(Integer disc_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();

			DiscountVO discountVO = new DiscountVO();
			discountVO.setDisc_id(disc_id);
			session.delete(discountVO);

			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public DiscountVO findByPrimaryKey(Integer disc_id) {
		DiscountVO discountVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			discountVO = (DiscountVO) session.get(DiscountVO.class, disc_id);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return discountVO;
	}

	@Override
	public List<DiscountVO> getAll() {
		List<DiscountVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
	
	public static void main(String[] args) {

		DiscountDAO dao = new DiscountDAO();
		List<DiscountVO> list = dao.getAll();
		for (DiscountVO aEmp : list) {
			System.out.print(aEmp.getDisc_id() + ",");
			System.out.print(aEmp.getDisc_name() + ",");
			System.out.print(aEmp.getDisc_value() + ",");
		
		}
	}
}
