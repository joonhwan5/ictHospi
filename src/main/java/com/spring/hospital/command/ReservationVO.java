package com.spring.hospital.command;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

/*
-- 예약
CREATE TABLE reservation (
    rv_no NUMBER PRIMARY KEY,
    doctor_no NUMBER(10) NOT NULL,
    user_id VARCHAR2(50) NOT NULL,
    rv_date VARCHAR2(10) NOT NULL,
    rv_time VARCHAR2(10) NOT NULL,
    pick_up_time VARCHAR2(10) NOT NULL
);
*/

@Getter
@Setter
@ToString
public class ReservationVO {
	
	private int rvNo;
	private int doctorNo;
	private String userId;
	private String rvDate;
	private String rvTime;
	private String pickUpTime;

}
