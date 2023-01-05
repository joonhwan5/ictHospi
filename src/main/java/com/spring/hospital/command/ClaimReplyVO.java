package com.spring.hospital.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

/*
-- 문의사항 댓글
CREATE TABLE claim_reply (
    rno NUMBER PRIMARY KEY,
    bno NUMBER(10) NOT NULL,
    admin_id VARCHAR2(50) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    reg_date DATE DEFAULT sysdate
);
*/

@Getter
@Setter
@ToString
public class ClaimReplyVO {
	
	private int rno;
	private int bno;
	private String adminId;
	private String adminPw;
	private String content;
	private Timestamp regDate;

}
