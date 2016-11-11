package com.member.model;

import java.util.List;

public interface MemberDAO_interface {
	public MemberVO insert(MemberVO memberVO);
	public void update(MemberVO memberVO);
	public void delete(Integer member_id);
	public MemberVO findByPrimaryKey(Integer member_id);
	public String findByPhone(String member_phone);
	public List<MemberVO> getAll();

}
