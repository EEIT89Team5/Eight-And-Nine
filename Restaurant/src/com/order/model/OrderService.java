package com.order.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import com.discount.model.DiscountVO;
import com.emp.model.EmpVO;
import com.member.model.MemberVO;
import com.orderx.model.OrderXVO;

public class OrderService {

	private OrderDAO_interface dao;

	public OrderService() {
		this.dao = new OrderDAO();
	}

	public OrderVO addOrder(String order_table, Date order_date, Integer order_price, Integer order_numP,
			Integer order_mem, Integer order_emp) {

		OrderVO orderVO = new OrderVO();

		orderVO.setOrder_table(order_table);
		orderVO.setOrder_date(order_date);
		orderVO.setOrder_price(order_price);
		orderVO.setOrder_numP(order_numP);

		MemberVO memberVO = new MemberVO();
		memberVO.setMember_id(order_mem);
		orderVO.setMemberVO(memberVO);

		EmpVO empVO = new EmpVO();
		empVO.setEmp_id(order_emp);
		orderVO.setEmpVO(empVO);
		// orderVO.setOrder_disc(order_disc);
		// orderVO.setOrder_paytime(order_paytime);

		dao.insert(orderVO);

		return orderVO;
	}

	public OrderVO addOrder(OrderVO orderVO) {

		dao.insert(orderVO);

		return orderVO;
	}

	public OrderVO addOrderWithX(OrderVO orderVO, List<OrderXVO> orderXVOs) {
		return dao.insertWithXs(orderVO, orderXVOs);
	}

	public OrderVO addOrderWithNewX(OrderVO orderVO, List<OrderXVO> orderXVOs) {
		return dao.insertXs(orderVO, orderXVOs);
	}

	public OrderVO updateOrder(Integer order_id, String order_table, Date order_date, Integer order_price,
			Integer order_numP, Integer order_mem, Integer order_emp, Integer order_disc, Timestamp order_paytime) {

		OrderVO orderVO = new OrderVO();

		orderVO.setOrder_id(order_id);
		orderVO.setOrder_table(order_table);
		orderVO.setOrder_date(order_date);
		orderVO.setOrder_price(order_price);
		orderVO.setOrder_numP(order_numP);
		MemberVO memberVO = new MemberVO();
		memberVO.setMember_id(order_mem);
		orderVO.setMemberVO(memberVO);

		EmpVO empVO = new EmpVO();
		empVO.setEmp_id(order_emp);
		orderVO.setEmpVO(empVO);

		DiscountVO discountVO = new DiscountVO();
		discountVO.setDisc_id(order_disc);
		orderVO.setDiscountVO(discountVO);
		orderVO.setOrder_paytime(order_paytime);

		dao.update(orderVO);

		return orderVO;
	}

	public OrderVO updateOrder(OrderVO orderVO) {

		dao.update(orderVO);

		return orderVO;
	}

	public void deleteOrder(Integer order_id) {
		dao.delete(order_id);
	}

	public OrderVO getOneOrder(Integer order_id) {

		return dao.findsByPrimaryKey(order_id);
	}

	public List<OrderXVO> getOneOrderDetails(Integer order_id) {
		return dao.getOrderDetailsByPrimaryKey(order_id);
	}

	public List<OrderVO> getUnpaidOrdersByDate(Date order_date)  {
		return dao.getUnpaidOrdersByDate(order_date) ;
	}
	
	public List<OrderVO> getAllOrder() {
		return dao.getAll();
	}

	public OrderVO findsByTableName(String order_table) {
		return dao.findsByTableName(order_table);
	}
	
	public OrderVO getOrderDetailsByTableName(String order_table){
		return dao.getOrderDetailsByTableName(order_table);
	}
	
}
