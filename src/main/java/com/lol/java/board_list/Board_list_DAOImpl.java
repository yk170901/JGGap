package com.lol.java.board_list;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("board_list_DAO")
public class Board_list_DAOImpl implements Board_list_DAO{

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public List<Board_list_VO> admin_boardList() {
		return mybatis.selectList("Board_list_DAO.admin_boardList");
	}

	@Override
	public int countBoard() {
		// TODO Auto-generated method stub
		return mybatis.selectOne("Board_list_DAO.countBoard");
	}

	@Override
	public List<Board_list_VO> selectBoard(Paging_VO vo) {
		// TODO Auto-generated method stub
		System.out.println("----셀렉트 보드 시작----");
		if(vo.getSearch_check_map() != null) {
			for(int i=0; i<vo.getSearch_check_map().length; i++) {
				System.out.println(vo.getSearch_check_map()[i]);
			}
		}
		if(vo.getSearch_check_mode() != null) {
			for(int i=0; i<vo.getSearch_check_mode().length; i++) {
				System.out.println(vo.getSearch_check_mode()[i]);
			}
		}
		System.out.println(vo.getSearchCondition());
		System.out.println(vo.getSearchKeyword());
		System.out.println("----셀렉트 보드 끝----");
		
		
		return mybatis.selectList("Board_list_DAO.selectBoard", vo);
	}

	@Override
	public int searchCountBoard(Paging_VO vo) {
		// TODO Auto-generated method stub
		System.out.println("----서치 카운트보드 시작----");
		if(vo.getSearch_check_map() != null) {
			for(int i=0; i<vo.getSearch_check_map().length; i++) {
				System.out.println(vo.getSearch_check_map()[i]);
			}
		}
		
		if(vo.getSearch_check_mode() != null) {
			for(int i=0; i<vo.getSearch_check_mode().length; i++) {
				System.out.println(vo.getSearch_check_mode()[i]);
			}
		}
		System.out.println("----서치 카운트보드 끝----");
		return mybatis.selectOne("Board_list_DAO.searchCountBoard", vo);
	}


	
}
