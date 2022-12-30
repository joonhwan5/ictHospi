package com.spring.hospital.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
-- 공지사항
CREATE TABLE board_notice(
    bno NUMBER(10) PRIMARY KEY,
    admin_id VARCHAR2(50) NOT NULL,
    title VARCHAR2(100) NOT NULL,
    content VARCHAR2(3000) NOT NULL,
    count NUMBER DEFAULT 0,
    reg_date DATE DEFAULT sysdate
);
*/

@Getter
@Setter
@ToString
public class NoticeVO {
	
	private int bno;
	private String adminId;
	private String title;
	private String content;
	private int count;
	private Timestamp regDate;

}
