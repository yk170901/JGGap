package com.lol.java.board_list;

import java.util.List;

public interface Board_list_Service {

	List<Board_list_VO> admin_boardList();
	
	List<Board_list_VO> boardList(String result);

//	List<Board_list_VO> search_boardList();

}
