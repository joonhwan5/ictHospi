package com.spring.hospital.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;



@Getter
@Setter
@ToString
public class ClaimReplyVO {
	
	private int rno;
	private int bno;
	private String adminId;
	private String content;
	private Timestamp regDate;

}
