package com.stj.tunnel.blacklizard.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Member {
	private int id;
	private String regDate;
	private String updateDate;
	private String loginId;
	private String loginPw;
	private String name;
	private String email;
	
	// 관리자 권한
	public boolean isAdmin() {
		return "admin".equals(loginId);
	}
}
