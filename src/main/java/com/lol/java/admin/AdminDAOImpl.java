package com.lol.java.admin;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO{

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public List<AdminVO> user_list(Paging_VO vo) {
		
		return mybatis.selectList("AdminDAO.user_list", vo);
	}

	@Override
	public int member_count() {
		
		return mybatis.selectOne("AdminDAO.member_count");
	}

	@Override
	public void grant(AdminVO vo) {
		mybatis.insert("AdminDAO.grant",vo);
	}

	@Override
	public int conversion(String user_id) {
		
		return mybatis.selectOne("AdminDAO.conversion",user_id);
	}

	@Override
	public int report_count() {

		return mybatis.selectOne("AdminDAO.report_count");
	}

	@Override
	public List<AdminVO> report_list(Paging_VO vo) {
		
		return mybatis.selectList("AdminDAO.report_list",vo);
	}

	@Override
	public int overlap_check(AdminVO vo) {
		
		return mybatis.selectOne("AdminDAO.overlap_check",vo);
	}

	@Override
	public void accepted(AdminVO vo) {
		
		mybatis.update("AdminDAO.accepted_first",vo);
		mybatis.update("AdminDAO.accepted_second",vo);
	}
	
}
