package com.space.model;

import java.util.List;

public class SpaceService {
	
	private SpaceDAO_interface dao;
	
	public SpaceService(){
		dao=new SpaceDAO();
	}
	
	public void addSpace(String space_name){
		SpaceVO spaceVO = new SpaceVO();;
		spaceVO.setSpace_name(space_name);
		spaceVO.setSpace_size("大型");
		dao.insert(spaceVO);
	}
	public void update(SpaceVO spaceVO){
		dao.update(spaceVO);
	}
	public void delete(Integer space_id){
		dao.delete(space_id);
	}
	public SpaceVO findByPrimaryKey(Integer space_id){
		return dao.findByPrimaryKey(space_id);
	}
	public SpaceVO findBySpaceName(String space_name){
		return dao.findBySpaceName(space_name);
	}
	public List<SpaceVO> getAll(){
		return dao.getAll();
	}
}
