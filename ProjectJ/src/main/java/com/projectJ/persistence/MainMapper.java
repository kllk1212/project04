package com.projectJ.persistence;

import com.projectJ.controller.UserInfoDTO;

public interface MainMapper {
	
	
	public int idCheck(UserInfoDTO dto);				// 아이디 중복체크 중복이면 1리턴 아니면 0리턴!
	public void insertUserData(UserInfoDTO userDTO); // 회원가입기능

}
