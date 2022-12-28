package com.spring.hospital.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
-- 식단
CREATE TABLE board_food(
    bno NUMBER(10) PRIMARY KEY,
    admin_id VARCHAR2(50) NOT NULL,
    title VARCHAR2(100) NOT NULL,
    upload_path VARCHAR2(100) NOT NULL,
    file_loca VARCHAR2(100) NOT NULL,
    file_name VARCHAR2(50) NOT NULL,
    file_real_name VARCHAR2(50) NOT NULL,
    count NUMBER DEFAULT 0,
    reg_date DATE DEFAULT sysdate
);
*/

@Getter
@Setter
@ToString
public class FoodVO {
	
	private int bno;
	private String adminId;
	private String title;
	private String uploadPath;
	private String fileLoca;
	private String fileName;
	private String fileRealName;
	private int count;
	private Timestamp regDate;

}
