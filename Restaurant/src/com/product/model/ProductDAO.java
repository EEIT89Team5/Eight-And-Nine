package com.product.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.classic.Session;

import com.dishclass.model.DishClassVO;
import com.packageformat.model.PackageFormatVO;
import com.productkind.model.ProductKindVO;

import hibernate.util.HibernateUtil;

public class ProductDAO implements ProductDAO_interface {
	
	
	@Override
	public ProductVO findByPrimaryKey(Integer product_id) {
		ProductVO productVO=null;
		
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			productVO=(ProductVO) session.get(ProductVO.class, product_id);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		
		return productVO;
	}
	@Override
	public List<PackageFormatVO> getFormat(Integer product_id){
		
		List<PackageFormatVO> productVOs = new LinkedList<PackageFormatVO>();

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("FROM PackageFormatVO WHERE pcg_id=?");
			query.setParameter(0, product_id);
			productVOs = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return productVOs;
	}
	
	
	@Override
	public List<ProductVO> getAllSingleDishes() {
		List<ProductVO> productVOs = new LinkedList<ProductVO>();

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("FROM ProductVO WHERE product_kind=1 ");
			productVOs = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return productVOs;
	}

	@Override
	public List<ProductVO> getSingleDishesByClass(Integer class_id) {
		List<ProductVO> productVOs = new LinkedList<ProductVO>();

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("FROM ProductVO WHERE product_kind=1 AND inMenu=1 AND product_class=?");
			query.setInteger(0, class_id);
			productVOs = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return productVOs;
	}

	@Override
	public List<ProductVO> getAllPackages() {
		List<ProductVO> productVOs = new LinkedList<ProductVO>();

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("FROM ProductVO WHERE product_kind=2 AND inMenu=1 ");
			productVOs = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return productVOs;
	}

	@Override
	public List<ProductVO> getDishesByPackage(Integer pcg_id) {
		List<ProductVO> productVOs = new LinkedList<ProductVO>();

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("FROM ProductVO WHERE product_pcg=?");
			query.setInteger(0, pcg_id);
			productVOs = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return productVOs;
	}

	@Override
	public List<ProductVO> getDishesByPackageAndClass(Integer pcg_id, Integer class_id) {
		List<ProductVO> productVOs = new LinkedList<ProductVO>();

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("FROM ProductVO WHERE product_pcg=? AND product_class=?");
			query.setInteger(0, pcg_id);
			query.setInteger(1, class_id);
			productVOs = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return productVOs;
	}

	@Override
	public List<ProductVO> getAllProducts() {
		List<ProductVO> productVOs = new LinkedList<ProductVO>();

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("FROM ProductVO");
			productVOs = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return productVOs;
	}
	
	//===================================從Servlet轉交===================================		
	
		
		//Service的updatePro轉交
		@Override
		public ProductVO update(ProductVO productVO) {
			Session session=HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				Query query=session.createQuery("update ProductVO set product_name=?,product_price=?,product_kind=?,product_class=?,product_pcg=?,InMenu=?,product_intro=? where product_id=?");
				query.setParameter(0, productVO.getProduct_name());
				query.setParameter(1, productVO.getProduct_price());
				query.setParameter(2, productVO.getProductKindVO().getKind_id());
				query.setParameter(3, productVO.getDishClassVO().getClass_id());
				query.setParameter(4, productVO.getProduct_pcg());
				query.setParameter(5, productVO.getInMenu());
				query.setParameter(6, productVO.getProduct_intro());
				query.setParameter(7, productVO.getProduct_id());
				query.executeUpdate();
				session.getTransaction().commit();
			}catch(RuntimeException ex){
				session.getTransaction().rollback();
				ex.printStackTrace();
			}
			return productVO;
		}
		
		
		//Service的updateProimg轉交
		@Override
		public ProductVO proimgup(ProductVO productVO) {
			Session session=HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				ProductVO productVOO=(ProductVO)session.get(ProductVO.class,productVO.getProduct_id());
				productVOO.setProduct_img(productVO.getProduct_img());
				session.getTransaction().commit();
			}catch(RuntimeException ex){
				session.getTransaction().rollback();
				ex.printStackTrace();
			}
			return productVO;
		}

		
		//Service的deletePro轉交
		@Override
		public void delete(Integer product_id) {
			Session session=HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				ProductVO proVO=(ProductVO)session.get(ProductVO.class,product_id);
				session.delete(proVO);
				session.getTransaction().commit();
			}catch(RuntimeException ex){
				session.getTransaction().rollback();
				ex.printStackTrace();
			}

		}
		
		
		//Service的addSinglePro轉交
		@Override
		public ProductVO insertSinglePro(ProductVO productVO) {
			
			Session session=HibernateUtil.getSessionFactory().getCurrentSession();
			try{
				session.beginTransaction();
				session.saveOrUpdate(productVO);
				session.getTransaction().commit();
			}catch(RuntimeException ex){
				session.getTransaction().rollback();
			}
			
			return productVO;
		}
		
		
		//Service的addPack轉交
		@Override
		public ProductVO insertPack(ProductVO productVO) {
				Session session=HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				session.saveOrUpdate(productVO);
				session.getTransaction().commit();	
			}catch(RuntimeException ex){
				session.getTransaction().rollback();
			}
			return productVO;
		}
		

		//Service的addPackPro轉交
		@Override
		public ProductVO insertPackPro(ProductVO productVO) {
			Session session=HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				session.saveOrUpdate(productVO);
				session.getTransaction().commit();
			}catch(RuntimeException ex){
				
				ex.printStackTrace();
			}
			return productVO;

		}
		
		
		//Service的selectPackPro轉交
		@Override
		public List<ProductVO> selectPackPro(ProductVO productVO) {
			Session session=HibernateUtil.getSessionFactory().getCurrentSession();
			List<ProductVO> list=null;
			try {
				session.beginTransaction();
				Query query=session.createQuery("from ProductVO where product_pcg=? and product_kind=? and product_price=? order by product_class");
				query.setParameter(0,productVO.getProduct_pcg());
				query.setParameter(1,productVO.getProductKindVO().getKind_id());
				query.setParameter(2,productVO.getProduct_price());
				list=query.list();
				session.getTransaction().commit();
			}catch(RuntimeException ex){
				session.getTransaction().rollback();
				ex.printStackTrace();
			}
			return list;
		}
		
		@Override
		public PackageFormatVO AddClassNum(PackageFormatVO packageFormatVO){
			Session session=HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				session.saveOrUpdate(packageFormatVO);
				session.getTransaction().commit();
			}catch(RuntimeException ex){
				session.getTransaction().rollback();
				ex.printStackTrace();
			}
			return packageFormatVO;
			
			
		}
		
		@Override
		public PackageFormatVO UPclassNumber(PackageFormatVO packageFormatVO){
			Session session=HibernateUtil.getSessionFactory().getCurrentSession();
			PackageFormatVO PKVO=null;
			try {
				session.beginTransaction();
				Query query=session.createQuery("update PackageFormatVO set class_number=? where pcg_id=? and class_id=?");
				query.setParameter(0,packageFormatVO.getClass_number());
				query.setParameter(1,packageFormatVO.getProductVO().getProduct_id());
				query.setParameter(2,packageFormatVO.getDishClassVO().getClass_id());
				query.executeUpdate();
				session.getTransaction().commit();
			}catch(RuntimeException ex){
				session.getTransaction().rollback();
				ex.printStackTrace();
			}
			return PKVO;
			
			
		}
		
		@Override
		public ProductVO UpdatePackPro(ProductVO productVO) {
			Session session=HibernateUtil.getSessionFactory().getCurrentSession();
			
			ProductVO PKVO=null;
			try {
				session.beginTransaction();
				Query query=session.createQuery("update ProductVO set product_name=?,product_price=?,product_kind=? where product_id=?");
				query.setParameter(0,productVO.getProduct_name());
				query.setParameter(1,productVO.getProduct_price());
				query.setParameter(2,productVO.getProductKindVO().getKind_id());
				query.setParameter(3,productVO.getProduct_id());
				query.executeUpdate();
				session.getTransaction().commit();
			}catch(RuntimeException ex){
				session.getTransaction().rollback();
				ex.printStackTrace();
			}
			return PKVO;
		}

		
	//=================================================================================
		
		
	//===================================非Servlet轉交===================================		
		@Override
		public List<ProductVO> getSingle(){
			List<ProductVO> list=null;
			Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		try{	
			session.beginTransaction();
			Query query=session.createQuery("from ProductVO where product_kind=1");
			list=query.list();
			session.getTransaction().commit();
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;
		}	
			return list;
		}
		
		
		
		
		//Service的getAll轉交
		@Override
		public List<ProductVO> getAll() {
				List<ProductVO> list=null;
				Session session=HibernateUtil.getSessionFactory().getCurrentSession();
			try{	
				session.beginTransaction();
				Query query=session.createQuery("from ProductVO");
				list=query.list();
				session.getTransaction().commit();
			}catch(RuntimeException ex){
				session.getTransaction().rollback();
				throw ex;
			}
			return list;
		}
		

		//Service的SelectPack轉交
		@Override
		public List<ProductVO> SelectPack(Integer product_kind) {
			Session session=HibernateUtil.getSessionFactory().getCurrentSession();
			List<ProductVO> list=null;
			try {
				session.beginTransaction();
				Query query=session.createQuery("from ProductVO where product_kind=?");
				query.setParameter(0, product_kind);
				list=query.list();
				session.getTransaction().commit();
			}catch(RuntimeException ex){
				session.getTransaction().rollback();
				ex.printStackTrace();
			}
			return list;
		}

		
		//Service的SelectMAXPack轉交
		@Override
		public Integer SelectMAXPack(Integer product_kind) {
			Session session=HibernateUtil.getSessionFactory().getCurrentSession();
			Integer result=null;
			try{
				session.beginTransaction();
				Query query=session.createSQLQuery("select max(product_id) from Product where product_kind=?");
				query.setParameter(0, product_kind);
				 result = (Integer) query.uniqueResult();
				session.beginTransaction().commit();
			}catch(RuntimeException ex){
				session.getTransaction().rollback();
				ex.printStackTrace();
			}
			return result;
		}

		
		//Service的getOneClass轉交
		@Override
		public List<ProductVO> getOneClass(Integer product_class,Integer product_price) {
			Session session=HibernateUtil.getSessionFactory().getCurrentSession();
			List<ProductVO> list=null;
			try {
				session.beginTransaction();
				Query query=session.createQuery("from ProductVO where product_class=? and product_price!=? ");
				query.setParameter(0, product_class);
				query.setParameter(1, product_price);		
				list=query.list();		
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
			
			} 
			return list;
		}
		
		

		//Service的getOneSingleClass轉交
		@Override
		public List<ProductVO> getOneSingleClass(Integer product_class,Integer product_price) {
			Session session=HibernateUtil.getSessionFactory().getCurrentSession();
			List<ProductVO> list=null;
			try {
				session.beginTransaction();
				Query query=session.createQuery("from ProductVO where product_class=? and product_price=?");
				query.setParameter(0, product_class);
				query.setParameter(1, product_price);
				list=query.list();
				session.getTransaction().commit();
			}catch(RuntimeException ex){
				session.getTransaction().rollback();
				ex.printStackTrace();
			}
			return list;
		}
		

		//Service的getPro轉交
		@Override
		public List<ProductVO> getClass(Integer product_pcg) {
			List<ProductVO> list=null;
				Session session=HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				Query query=session.createQuery("from ProductVO where product_pcg=? order by product_class");
				query.setParameter(0, product_pcg);
				list=query.list();
				session.getTransaction().commit();
			} catch(RuntimeException ex){
				session.getTransaction().rollback();
					ex.printStackTrace();
			}
			return list;
		}

	public static void main(String args[]) {

//		ProductDAO productDAO = new ProductDAO();
//		 List<PackageFormatVO> list=productDAO.getFormat(10570);
//		for(PackageFormatVO ww:list){
//			System.out.println(ww.getClass_number());
//			System.out.println(ww.getDishClassVO().getClass_id());
//		}
		
//		ProductDAO productDAO = new ProductDAO();
		// List<ProductVO> list=productDAO.getSingleDishesByClass(20);

//		List<ProductVO> list = productDAO.getAllSingleDishes();
//		List<ProductVO> list = productDAO.getSingleDishesByClass(30);
//		List<ProductVO> list = productDAO.getAllPackages();
//		List<ProductVO> list = productDAO.getDishesByPackageAndClass(11070, 40);
//		List<ProductVO> list = productDAO.getDishesByPackage(10700);
//		 List<ProductVO> list=productDAO.getAllProducts();

//		for (ProductVO productVOs : list) {
//			System.out.println("--------------------------");
//			System.out.println("商品編號:" + productVOs.getProduct_id());
//			System.out.println("商品名稱:" + productVOs.getProduct_name());
//			System.out.println("商品價格:" + productVOs.getProduct_price());
//			System.out.println("商品種類:" + productVOs.getProductKindVO().getKind_name());
//			if (productVOs.getDishClassVO() != null) {
//				System.out.println("所屬菜色類型:" + productVOs.getDishClassVO().getClass_name());
//			} else {
//				System.out.println("所屬菜色類型:無");
//			}
//			System.out.println("所屬套餐編號:"+productVOs.getProduct_pcg());
//			if (productVOs.getPcgVO() != null) {
//				System.out.println("所屬套餐名稱:" + productVOs.getPcgVO().getProduct_name());
//			} else {
//				System.out.println("所屬套餐名稱:無");
//			}
//			System.out.println("商品圖片:" + productVOs.getProduct_img());
//			System.out.println("在菜單中" + productVOs.getInMenu());
//			System.out.println("商品介紹" + productVOs.getProduct_intro());
		
//		}
		

	}


}
