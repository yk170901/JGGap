package com.lol.java.profile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("profileService")
public class ProfileServiceImpl implements ProfileService{

	@Autowired
	ProfileDAO profileDAO;
	
}
