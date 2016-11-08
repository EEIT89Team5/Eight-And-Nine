package com.product.model;

import java.util.List;
import java.util.Set;

import com.packageformat.model.PackageFormatVO;

public class ProductService {
	
	private ProductDAO_interface dao;
	
	public ProductService(){
		this.dao=new ProductDAO();
	}
	
	public List<PackageFormatVO> packageformat(Integer product_id){
		return dao.getFormat(product_id);
	}
	
	
	public ProductVO findByPrimaryKey(Integer product_id){
		return dao.findByPrimaryKey(product_id);
	}
	
	public List<ProductVO> getSingleDishesByClass(Integer class_id){
		
		return dao.getSingleDishesByClass(class_id);	
	}
	public ProductVO getOnePro(Integer product_id) {
		return dao.findByPrimaryKey(product_id);
	}	
	
	public ProductVO updatePro(ProductVO productVO) {

		return dao.update(productVO);
	}
	
	public ProductVO updateProimg(ProductVO productVO) {
		return dao.proimgup(productVO);
	}
	
	public void deletePro(Integer product_id) {
		dao.delete(product_id);
	}

	public ProductVO addSinglePro(ProductVO productVO) {
		return dao.insertSinglePro(productVO);
	}
	
	public ProductVO addPack(ProductVO productVO) {
		return dao.insertPack(productVO);
	}
	
	public ProductVO addPackPro(ProductVO productVO) {
		return dao.insertPackPro(productVO);
	}
	
	public List<ProductVO> selectPackPro(ProductVO productVO) {
		return dao.selectPackPro(productVO);
	}
	
	public ProductVO UpdatePackPro(ProductVO productVO){
		return dao.UpdatePackPro(productVO);
	}
	
	public PackageFormatVO AddClassNum(PackageFormatVO packageFormatVO){
		return dao.AddClassNum(packageFormatVO);
	}
	
	
	public PackageFormatVO UPclassNumber(PackageFormatVO packageFormatVO){
		return dao.UPclassNumber(packageFormatVO);
	}
	
//=================================================================================
	
	
//===================================非Servlet轉交===================================	
	public List<ProductVO> getSingle(){
		return dao.getSingle();
	}
	
	
	public List<ProductVO> getAll() {
		return dao.getAll();
	}
	
	public List<ProductVO> SelectPack(Integer product_kind) {
		return dao.SelectPack(product_kind);
	}
	
	public Integer SelectMAXPack(Integer product_kind) {
		return dao.SelectMAXPack(product_kind);
	}
	
	public List<ProductVO> getOneClass(Integer product_class,Integer product_price) {
		return dao.getOneClass(product_class,product_price);
	}
	
	public List<ProductVO> getOneSingleClass(Integer product_class,Integer product_price) {
		return dao.getOneSingleClass(product_class,product_price);
	}
	
	public List<ProductVO> getPro(Integer product_pcg) {
		return dao.getClass(product_pcg);
	}

	
	public static void main(String args[]){
		
		ProductService productSvc=new ProductService();
		List<ProductVO> list=productSvc.getSingleDishesByClass(20);
		for(ProductVO productVOs:list){
			System.out.println(productVOs.getProduct_id());
			System.out.println(productVOs.getProduct_name());
			System.out.println(productVOs.getProduct_price());
			System.out.println(productVOs.getProduct_img());
			System.out.println(productVOs.getProduct_intro());
		}
	}
	
}
