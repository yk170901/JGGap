package com.lol.java.record;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("recordService")
public class RecordServiceImpl implements RecordService{

	@Autowired
	RecordDAO recordDAO;
	
}
