package com.discount.model;

import java.util.List;

public class DiscountService {
	private DiscountDAO_interface dao;

	public DiscountService() {
		dao = new DiscountDAO();
	}

	public DiscountVO addDisc(String disc_name, Double disc_value) {

		DiscountVO discountVO = new DiscountVO();

		discountVO.setDisc_name(disc_name);
		discountVO.setDisc_value(disc_value);
		dao.insert(discountVO);

		return discountVO;
	}

	public DiscountVO updateDisc(Integer disc_id, String disc_name, Double disc_value) {

		DiscountVO discountVO = new DiscountVO();

		discountVO.setDisc_id(disc_id);
		discountVO.setDisc_name(disc_name);
		discountVO.setDisc_value(disc_value);
		dao.update(discountVO);

		return dao.findByPrimaryKey(disc_id);
	}
	
	public void deleteDisc(Integer disc_id) {
		dao.delete(disc_id);
	}

	public DiscountVO getOneDisc(Integer disc_id) {
		return dao.findByPrimaryKey(disc_id);
	}

	public List<DiscountVO> getAll() {
		return dao.getAll();
	}
}
