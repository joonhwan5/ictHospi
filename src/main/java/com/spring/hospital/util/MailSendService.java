package com.spring.hospital.util;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class MailSendService {
	
	@Autowired
	private JavaMailSender mailSender;
	private int authNum;
	
	//난수 발생 (맘대로 설정해야지)
	public void makeRandomNumber() {
		// 난수의 범위: 111111 ~ 999999
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		System.out.println("인증번호: "+ checkNum);
		authNum = checkNum;
	}
	
	//회원 가입 시 사용할 이메일 양식
	public String joinEmail(String email) {
		makeRandomNumber(); //인증번호 생성
		
		String setFrom = "springtest1214@naver.com"; //email-config에 설정한 발신용 이메일 주소를 입력.
		String toMail = email; //수신받을 이메일
		String title = "회원가입 인증 이메일입니다."; //이메일 제목
		String content = "홈페이지를 방문해 주셔서 감사합니다."
				+ "<br><br>"
				+ "인증번호는 <strong>" + authNum + "</strong> 입니다."
				+ "<br>"
				+ "해당 인증 번호를 인증번호 확인란에 기입해 주세요."; //이메일 삽입할 내용
		
		mailSend(setFrom, toMail, title, content);
		
		return Integer.toString(authNum); //점수를 문자열로 변환하여 리턴.
		
	}

	//이메일 전송 메서드
	private void mailSend(String setFrom, String toMail, String title, String content) {
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			//기타 설정들을 담당할 MimeMessageHelper 객체를 생성.
			//생성자의 매개값으로는 MimeMessage 객체, bool, 문자 인코딩 설정
			//true 매개값을 전달하면 MultPart 형식의 메세지 전달이 가능. (첨부 파일)
			//값을 전달하지 않는다면 단순 텍스트만 사용.
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			//true -> html 형식으로 전송, 안주면 단순 텍스트로 전달.
			helper.setText(content, true);
			
			//메일 전송
			mailSender.send(message);
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
	}
	
}


































