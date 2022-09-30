package com.projectJ.service;

import com.projectJ.domain.UserInfoDTO;

public interface MainService {
	
	
	public int idCheck(UserInfoDTO dto);				// 아이디 중복체크
	public void insertUserData(UserInfoDTO userDTO); // 회원가입기능



}
