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
		for(int i=1; i<=30; i++) {
			ClaimVO vo = new ClaimVO();
			vo.setTitle("마이페이지용 " + i);
			vo.setUserId("abc1234");
			vo.setContent("메롱메롱 " + i);
			mapper.regist(vo);
		}
	}
}
