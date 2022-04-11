package com.lol.java.board_detail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("board_detail_Service")
public class Board_detail_ServiceImpl implements Board_detail_Service{

	@Autowired
	Board_detail_DAO board_detail_DAO;
	
}
