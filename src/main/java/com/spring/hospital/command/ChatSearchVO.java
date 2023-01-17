package com.spring.hospital.command;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatSearchVO {
	private String keyword;
	private String className;
	private int hit;
}
