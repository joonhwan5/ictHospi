package com.spring.hospital.util;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import com.spring.hospital.command.ReservationVO;

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
	
	//예약 완료 시 사용할 이메일 양식
	public String reserveCompleteEmail(String email, String userName, ReservationVO vo, String msg) {
		
		if(msg.equals("complete")) {
			msg = "완료";
		} else if (msg.equals("update")) {
			msg = "수정";
		} else {
			msg = "삭제";
		}
		
		int time = Integer.parseInt(vo.getRvTime());
		String setTime = time > 12 ? "오후" + (time - 12) + "시" : "오전" + time + "시";
		setTime = time == 12 ? "오후" + time + "시" : setTime;
		
		String setpTime = "";
		if(vo.getPickUpTime().equals("-1")) {
			setpTime = "-";
		} else {
			int ptime = Integer.parseInt(vo.getPickUpTime());
			setpTime = ptime > 12 ? "오후" + (ptime - 12) + "시" : "오전" + ptime + "시";
			setpTime = ptime == 12 ? "오후" + ptime + "시" : setpTime;
		}
		
		String setFrom = "springtest1214@naver.com";
		String toMail = email;
		String title = userName + "님의 예약이 " + msg + "되었습니다.";
		String content = 
				"<div style=\"border: 1px solid rgb(187, 187, 187); color: rgb(63, 63, 63); width: 500px; padding: 20px 0 40px 40px; \">"
        	+		"<h3 style=\"padding-bottom: 5px;\">" + title + "</h3>"
        	+		"<p style=\"padding-bottom: 7px;\">"
        	+			"예약번호 : " + vo.getRvNo() + "<br>"
        	+			"의사이름 : " + vo.getDoctorName() + "<br>"
        	+			"예약과 : " + vo.getMedicalDepartment() + "<br>"
	        +			"예약일자 : " + vo.getRvDate() + "<br>"
	        +			"예약시간 : " + setTime + "<br>"
	        +			"픽업시간 : " + setpTime
    		+		"</p>"
    		+	"</div>";	
		
		mailSend(setFrom, toMail, title, content);
		
		
		return "reserveComplete";
	}
	
	// 비밀번호 찾기 이메일 양식
	public String userFindPwEmail(String email) {
		makeRandomNumber(); //인증번호 생성
		
		String setFrom = "springtest1214@naver.com"; //email-config에 설정한 발신용 이메일 주소를 입력.
		String toMail = email; //수신받을 이메일
		String title = "임시 비밀번호입니다."; //이메일 제목
		String content = "홈페이지를 방문해 주셔서 감사합니다."
				+ "<br><br>"
				+ "임시비밀번호는 <strong>" + authNum + "</strong> 입니다."
				+ "<br>"
				+ "임시비밀번호로 로그인 후 비밀번호를 변경해주십시오."; //이메일 삽입할 내용
		
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


































