package com.spring.hospital.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
-- 고객의 소리
CREATE TABLE board_claim(
    bno NUMBER(10) PRIMARY KEY,
    user_id VARCHAR2(50) NOT NULL,
    title VARCHAR2(100) NOT NULL,
    content VARCHAR2(3000) NOT NULL,
    count NUMBER DEFAULT 0,
    reg_date DATE DEFAULT sysdate
);
*/

@Getter
@Setter
@ToString
public class ClaimVO {
	
	private int bno;
	private String userId;
	private String title;
	private String content;
	private int count;
	private Timestamp regDate;
	private int rn;

}
