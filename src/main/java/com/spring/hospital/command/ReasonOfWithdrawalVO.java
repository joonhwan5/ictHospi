package com.spring.hospital.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReasonOfWithdrawalVO {
	private int reasonNo;
	private String userId;
	private String reason;
	private String content;
}
