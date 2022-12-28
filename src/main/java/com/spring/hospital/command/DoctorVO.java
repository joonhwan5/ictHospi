package com.spring.hospital.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
-- 의사
CREATE TABLE doctor(
    doctor_no NUMBER(10) PRIMARY KEY,
    doctor_name VARCHAR2(50) NOT NULL,
    medical_department VARCHAR2(50) NOT NULL,
    medical_charge VARCHAR2(100) NOT NULL,
    medical_intro VARCHAR2(1000) NOT NULL,
    upload_path VARCHAR2(100) NOT NULL,
    file_loca VARCHAR2(100) NOT NULL,
    file_name VARCHAR2(50) NOT NULL
);
*/

@Getter
@Setter
@ToString
public class DoctorVO {
	
	private int doctorNo;
	private String doctorName;
	private String medicalDepartment;
	private String medicalCharge;
	private String medicalIntro;
	private String uploadPath;
	private String fileLoca;
	private String fileName;

}
