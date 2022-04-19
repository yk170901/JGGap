package com.lol.java.board_view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("board_view_Service")
public class Board_view_ServiceImpl implements Board_view_Service{

	@Autowired
	Board_view_DAO board_view_DAO;

}
