package com.lol.java.board_list;

import java.util.List;

public interface Board_list_DAO {

	public List<Board_list_VO> admin_boardList();

	public int countBoard();

	public List<Board_list_VO> selectBoard(Paging_VO vo);

	public int searchCountBoard(Paging_VO vo);

}
