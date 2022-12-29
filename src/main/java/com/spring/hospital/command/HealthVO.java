package com.spring.hospital.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
-- 건강
CREATE TABLE health (
    bno NUMBER(10) PRIMARY KEY,
    admin_id VARCHAR2(50) NOT NULL,
    title VARCHAR2(50) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    upload_path VARCHAR2(100) NOT NULL,
    file_loca VARCHAR2(100) NOT NULL,
    file_name VARCHAR2(50) NOT NULL,
    reg_date DATE DEFAULT sysdate
);
*/

@Getter
@Setter
@ToString
public class HealthVO {
	
	private int bno;
	private String adminId;
	private String title;
	private String content;
	private String uploadPath;
	private String fileLoca;
	private String fileName;
	private Timestamp regDate;

}
