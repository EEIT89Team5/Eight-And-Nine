package com.member.model;

import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.classic.Session;

import hibernate.util.HibernateUtil;

public class MemberDAO implements MemberDAO_interface {

	@Override
	public MemberVO insert(MemberVO memberVO) {
		Integer newMemberID=null;
		MemberVO newMemberVO=null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.save(memberVO);
			Query query = session.createQuery("SELECT MAX(member_id) FROM MemberVO");
			List<Integer> rs=query.list();
			for(Integer memberID:rs){
				newMemberID=memberID;
			}
			newMemberVO=(MemberVO) session.get(MemberVO.class, newMemberID);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return newMemberVO;
	}

	@Override
	public void update(MemberVO memberVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(memberVO);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}

	}

	@Override
	public void delete(Integer member_id) {
		MemberVO memberVO = null;

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			memberVO = (MemberVO) session.get(MemberVO.class, member_id);
			session.delete(memberVO);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}


	}

	@Override
	public MemberVO findByPrimaryKey(Integer member_id) {
		MemberVO memberVO = null;

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			memberVO = (MemberVO) session.get(MemberVO.class, member_id);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return memberVO;
	}
	
	@Override
	public String findByPhone(String member_phone) {
		String result=null;
		
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("FROM MemberVO WHERE member_phone=?");
			query.setString(0, member_phone);
			List<MemberVO> rs=query.list();
			if(rs.size()!=0){
				result="手機號碼已存在";
			}else{
				result="手機號碼可使用";
			}
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		
		return result;
	}

	@Override
	public List<MemberVO> getAll() {
		List<MemberVO> memberVOs = new LinkedList<MemberVO>();

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("FROM MemberVO");
			memberVOs = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}

		return memberVOs;
	}

	public static void main(String[] args) {
		MemberDAO memberDAO = new MemberDAO();
		
		MemberVO memberVO=new MemberVO();
		//memberVO.setMember_id(10016);
		memberVO.setMember_name("李大龍");
		memberVO.setMember_phone("0984982722");
		memberVO.setMember_email("bruceLee@gmail.com");
		memberVO.setMember_password("hahaha");
		memberVO.setMember_gender("女");
		memberVO.setMember_register(Date.valueOf("2016-09-23"));
		
		//memberVO=memberDAO.insert(memberVO);
		
		
		//memberDAO.update(memberVO);
		
		//memberDAO.delete(10016);
		
//		MemberVO memberVO1=memberDAO.findByPrimaryKey(10013);
//		
//		System.out.println("----------------");
//		System.out.println("會員編號:"+memberVO1.getMember_id());
//		System.out.println("會員姓名:"+memberVO1.getMember_name());
//		System.out.println("會員電話:"+memberVO1.getMember_phone());
//		System.out.println("會員email:"+memberVO1.getMember_email());
//		System.out.println("會員密碼:"+memberVO1.getMember_password());
//		System.out.println("會員性別:"+memberVO1.getMember_gender());
//		System.out.println("會員註冊日:"+memberVO1.getMember_register());
//		
//		System.out.println(memberDAO.findByPhone("0927349882"));//歐巴馬
		
//		List<MemberVO> list = memberDAO.getAll();
//
//		for (MemberVO members : list) {
//			System.out.println("----------------");
//			System.out.println("會員編號:"+members.getMember_id());
//			System.out.println("會員姓名:"+members.getMember_name());
//			System.out.println("會員電話:"+members.getMember_phone());
//			System.out.println("會員email:"+members.getMember_email());
//			System.out.println("會員密碼:"+members.getMember_password());
//			System.out.println("會員性別:"+members.getMember_gender());
//			System.out.println("會員註冊日:"+members.getMember_register());
//		}

	}


}
