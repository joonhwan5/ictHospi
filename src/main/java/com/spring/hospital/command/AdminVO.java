package com.spring.hospital.command;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

/*
-- 관리자
CREATE TABLE admin (
    admin_id VARCHAR2(50) PRIMARY KEY,
    admin_pw VARCHAR2(50) NOT NULL,
    admin_name VARCHAR2(50) NOT NULL
);
*/

@Getter
@Setter
@ToString
public class AdminVO {
	
	private String adminId;
	private String adminPw;
	private String adminName;

}
