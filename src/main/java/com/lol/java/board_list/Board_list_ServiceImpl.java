package com.lol.java.board_list;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("board_list_Service")
public class Board_list_ServiceImpl implements Board_list_Service{

	@Autowired
	Board_list_DAO board_list_DAO;
	
}
