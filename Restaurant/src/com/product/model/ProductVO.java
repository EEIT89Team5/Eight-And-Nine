package com.product.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import com.dishclass.model.DishClassVO;
import com.orderx.model.OrderXVO;
import com.packageformat.model.PackageFormatVO;
import com.productkind.model.ProductKindVO;

public class ProductVO implements Serializable{

	private Integer product_id;
	private String product_name;
	private Integer product_price;
	private ProductKindVO productKindVO;
	private DishClassVO dishClassVO;
	private Integer product_pcg;//兩者都保留
	private ProductVO pcgVO;	//兩者都保留
	private byte[] product_img;
	private Integer inMenu;
	private String product_intro;
	
	private Set<PackageFormatVO> pcgFormats=new HashSet<PackageFormatVO>();
	private Set<ProductVO> pcgDishes=new HashSet<ProductVO>();
	private Set<OrderXVO> orderXs =new HashSet<OrderXVO>();
	
	public Integer getProduct_id() {
		return product_id;
	}
	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public Integer getProduct_price() {
		return product_price;
	}
	public void setProduct_price(Integer product_price) {
		this.product_price = product_price;
	}
	public ProductKindVO getProductKindVO() {
		return productKindVO;
	}
	public void setProductKindVO(ProductKindVO productKindVO) {
		this.productKindVO = productKindVO;
	}
	public DishClassVO getDishClassVO() {
		return dishClassVO;
	}
	public void setDishClassVO(DishClassVO dishClassVO) {
		this.dishClassVO = dishClassVO;
	}
	public Integer getProduct_pcg() {
		return product_pcg;
	}
	public void setProduct_pcg(Integer product_pcg) {
		this.product_pcg = product_pcg;
	}
	public ProductVO getPcgVO() {
		return pcgVO;
	}
	public void setPcgVO(ProductVO pcgVO) {
		this.pcgVO = pcgVO;
	}
	public byte[] getProduct_img() {
		return product_img;
	}
	public void setProduct_img(byte[] product_img) {
		this.product_img = product_img;
	}
	public Integer getInMenu() {
		return inMenu;
	}
	public void setInMenu(Integer inMenu) {
		this.inMenu = inMenu;
	}
	public String getProduct_intro() {
		return product_intro;
	}
	public void setProduct_intro(String product_intro) {
		this.product_intro = product_intro;
	}
	public Set<PackageFormatVO> getPcgFormats() {
		return pcgFormats;
	}
	public void setPcgFormats(Set<PackageFormatVO> pcgFormats) {
		this.pcgFormats = pcgFormats;
	}
	public Set<ProductVO> getPcgDishes() {
		return pcgDishes;
	}
	public void setPcgDishes(Set<ProductVO> pcgDishes) {
		this.pcgDishes = pcgDishes;
	}
	public Set<OrderXVO> getOrderXs() {
		return orderXs;
	}
	public void setOrderXs(Set<OrderXVO> orderXs) {
		this.orderXs = orderXs;
	}
	
	
}
