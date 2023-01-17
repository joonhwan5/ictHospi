package com.spring.hospital.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChatSearchVO {
	private String keyword;
	private String className;
	private int hit;
}
