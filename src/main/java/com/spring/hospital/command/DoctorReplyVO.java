package com.spring.hospital.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
-- 의사 댓글
CREATE TABLE doctor_reply (
    rno NUMBER PRIMARY KEY,
    doctor_no NUMBER(10) NOT NULL,
    user_id VARCHAR2(50) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    reg_date DATE DEFAULT sysdate
);


CREATE SEQUENCE doctor_reply_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 5000
    NOCYCLE
    NOCACHE;

*/

@Getter
@Setter
@ToString
public class DoctorReplyVO {
	
	private int rno;
	private int doctorNo;
	private String userId;
	private String content;
	private Timestamp regDate;

}
