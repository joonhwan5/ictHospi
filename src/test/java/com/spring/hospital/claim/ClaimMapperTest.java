package com.spring.hospital.claim;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.hospital.claim.mapper.IClaimMapper;
import com.spring.hospital.command.ClaimVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/config/mybatis-config.xml" ,"file:src/main/webapp/WEB-INF/config/db-config.xml"})
public class ClaimMapperTest {
	
	@Autowired
	private IClaimMapper mapper;
	
	@Test
	public void registTest() {
		for(int i=1; i<=5; i++) {
			ClaimVO vo = new ClaimVO();
			vo.setTitle("테스트용 " + i);
			vo.setContent("안녕하세요!!" + i);
			mapper.regist(vo);
		}
	}

}
