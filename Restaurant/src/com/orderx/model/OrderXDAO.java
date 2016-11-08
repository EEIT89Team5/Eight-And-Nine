package com.orderx.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.order.model.OrderVO;
import com.product.model.ProductVO;

import hibernate.util.HibernateUtil;


public class OrderXDAO implements OrderXDAO_interface {
//  =====================================================
	private static final String GET_ALL_STMT =
		    "FROM OrderXVO where orderVO.order_date =? order by orderX_time";
  private static final String FINISHNUM =
		  	"select count(orderX_status) from OrderTableX where order_id=? and orderX_status=?";
  private static final String IDMAX=
  		    "select count(orderX_status) from OrderTableX where order_id=? ";
//  ======================================================
	@Override
	public void insert(OrderXVO orderXVO) {

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		try {
			session.beginTransaction();
			session.save(orderXVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(Integer order_id, Integer product_id) {

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("DELETE FROM OrderXVO WHERE order_id=? AND product_id=?");
			query.setInteger(0, order_id);
			query.setInteger(1, product_id);
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}


	@Override
	public List<OrderXVO> findByProductName(String product_name) {

		Session session=HibernateUtil.getSessionFactory().getCurrentSession();	
		try{
			session.beginTransaction();
			
			
			session.getTransaction().commit();
		}catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return null;
	}

	@Override
	public List<OrderXVO> getAll() {
		List<OrderXVO> list = null;

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("FROM OrderXVO");
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;

	}

	@Override
	public Integer getDishQuantity(Integer kind_id, Integer class_id, List<OrderXVO> list) {

		Integer MDQ = 0;
		List<Long> listRS = null;

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(
					"SELECT COUNT(*) FROM ProductVO WHERE product_kind=? AND product_class=? " + "AND product_id=?");
			for (OrderXVO orderXs : list) {
				query.setInteger(0, kind_id);
				query.setInteger(1, class_id);
				query.setInteger(2, orderXs.getProductVO().getProduct_id());
				listRS = query.list();
				for (Long rs : listRS) {
					if (rs.intValue() == 1) {
						MDQ = MDQ + orderXs.getOrderX_num();
					}
				}
			}
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

		return MDQ;

	}

	@Override
	public Integer getPackageQuantity(List<OrderXVO> list) {
		Integer PCGQ = 0;
		List<Long> listRS = null;

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(
					"SELECT COUNT(*) FROM ProductVO WHERE product_kind=2 AND product_id=?");
			for (OrderXVO orderXs : list) {
				query.setInteger(0, orderXs.getProductVO().getProduct_id());
				listRS = query.list();
				for (Long rs : listRS) {
					if (rs.intValue() == 1) {
						PCGQ = PCGQ + orderXs.getOrderX_num();
					}
				}
			}
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

		return PCGQ;
	}
	
	@Override
	public Integer getTotalPrice(List<OrderXVO> list) {
		Integer totalP = 0;
		ProductVO productVO=new ProductVO();
		List<Long> listRS = null;

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			
			for (OrderXVO orderXs : list) {
				productVO=(ProductVO) session.get(ProductVO.class, orderXs.getProductVO().getProduct_id());

				totalP = totalP + (productVO.getProduct_price())*(orderXs.getOrderX_num());
				
			}
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

		return totalP;
	}
	
	public static void main(String args[]) {

		OrderXDAO orderXDAO = new OrderXDAO();
		
		//orderXDAO.delete(1, 10040);

		
		 //orderXDAO.insert(orderXVO1);
		
		List<OrderXVO> list = orderXDAO.getAll();

		for (OrderXVO orderXVOs : list) {
			System.out.println("-------------");
			System.out.println("order_id" + orderXVOs.getOrderVO().getOrder_id());
			System.out.println("product_id" + orderXVOs.getProductVO().getProduct_id());
			System.out.println("orderX_time" + orderXVOs.getOrderX_time());
			System.out.println("orderX_num" + orderXVOs.getOrderX_num());
			System.out.println("orderX_status" + orderXVOs.getOrderX_status());
		}
	}
//===============================================
	 @Override
		public void update(OrderXVO orderXVO) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
//				Query query=session.createQuery("from OrderXVO where order_id=? and product_id=? and orderX_time=?");
				session.saveOrUpdate(orderXVO);
				session.getTransaction().commit();
				
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}
	 @Override
		public List<OrderXVO> getAll(Date d2) {
			List<OrderXVO> list = null;
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				Query query = session.createQuery(GET_ALL_STMT);
				query.setParameter(0,d2);
				list = query.list();
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return list;
		}
		
		 @Override
			public Integer  FINISHNUM(OrderXVO orderXVO) {
				List<Integer> list = null;
				List<Integer> list2 = null;
				Integer num2=null;
				
				Session session = HibernateUtil.getSessionFactory().getCurrentSession();
				try {
					session.beginTransaction();
//					=====可查到狀態筆數========================================================
					Query query2 = session.createSQLQuery(FINISHNUM);
					query2.setParameter(0,orderXVO.getOrderVO().getOrder_id());
					query2.setParameter(1,"出餐完成");
					list2 = query2.list();
					num2=list2.get(0);
					session.getTransaction().commit();
				} catch (RuntimeException ex) {
					session.getTransaction().rollback();
					throw ex;
				}
				return num2;
			}
		 @Override
			public Integer  IDMAX(OrderXVO orderXVO) {
				List<Integer> list = null;
				List<Integer> list2 = null;
				Integer num=null;
				
				Session session = HibernateUtil.getSessionFactory().getCurrentSession();
				try {
					session.beginTransaction();
//					=====可查到狀態筆數========================================================
					Query query = session.createSQLQuery(IDMAX);
					query.setParameter(0,orderXVO.getOrderVO().getOrder_id());
					list2 = query.list();
					num=list2.get(0);
					session.getTransaction().commit();
				} catch (RuntimeException ex) {
					session.getTransaction().rollback();
					throw ex;
				}
				return num;
			}

//===============================================
}
