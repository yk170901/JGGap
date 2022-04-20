package com.lol.java.board_list;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("board_list_Service")
public class Board_list_ServiceImpl implements Board_list_Service{

	@Autowired
	private Board_list_DAO board_list_DAO;

	@Override
	public List<Board_list_VO> admin_boardList() {
		// TODO Auto-generated method stub
		return board_list_DAO.admin_boardList();
	}	
	
	@Override
	public List<Board_list_VO> boardList(String result) {
		// TODO Auto-generated method stub
		return board_list_DAO.boardList(result);
	}

//	@Override
//	public List<Board_list_VO> search_boardList() {
//		// TODO Auto-generated method stub
//		return board_list_DAO.search_boardList();
//	}


	
}
