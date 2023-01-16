package com.spring.hospital.command;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

import lombok.extern.log4j.Log4j;

@Component
@Log4j
public class KakaoLoginVO {
	
	/*
	 # 인증 요청문을 구성하는 파라미터
	 client_id: 애플리케이션 등록 후 발급받은 클라이언트 아이디
	 response_type: 인증 과정에 대한 구분값, code로 값이 고정
	 redirect_uri: 카카오 로그인 인증의 결과를 전달받을 콜백 URL (애플리케이션 등록할 때 지정한 정보)
	 state: 애플리케이션이 생성한 상태 토큰
	 */
	@Value("${kakao.clientId}")
	private String kakaoClientId;
	@Value("${kakao.clientSecret}")
	private String kakaoClientSecret;
	@Value("${kakao.redirectUrl}")
	private String kakaoRedirectUrl;
	private String sessionState = "kakao_oauth_state";
	//프로필 조회 api url
	@Value("${kakao.profileApiUrl}")
	private String profileApiUrl;
	
	//카카오 아이디로 인증 url 생성
	public String getAuthoriztionUrl(HttpSession session) {
		
		//나중에 비교할 세션 유효성 검증을 위해 자체적으로 난수를 하나 생성.
		String state = generateRandomString();
		//생성한 난수 값을 session에 저장.
		session.setAttribute(sessionState, state);
		
		//Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 카카오 인증 URL 생성.
		//만약 이거 없으면 여러분들이 직접 StringBuilder 사용해서 붙여야 합니다.
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(kakaoClientId)
				.apiSecret(kakaoClientSecret)
				.callback(kakaoRedirectUrl)
				.state(state) //앞서 생성한 난수값을 인증 URL생성 시 사용함.
				.build(KakaoOAuthApi.instance());
		
		//완성된 url을 문자열 형태로 리턴.
		return oauthService.getAuthorizationUrl();
	}
	
	//카카오 아이디로 Callback 처리 및 AccessToken 획득 메서드
	public OAuth2AccessToken getAccessToken(String code, String state, HttpSession session) throws Exception {
		
		log.info("getAccessToken 호출!");
		log.info(state);
		log.info(code);
		
		//Callback으로 전달 받은 세션검증용 난수값과 세션에 저장되어 있는 값이 일치하는지 확인.
		String sessionState = (String) session.getAttribute(this.sessionState);
		if(state.equals(sessionState)) {
			OAuth20Service oauthService = new ServiceBuilder()
					.apiKey(kakaoClientId)
					.apiSecret(kakaoClientSecret)
					.callback(kakaoRedirectUrl)
					.state(state).build(KakaoOAuthApi.instance());
			
			//Scribe에서 제공하는 AccessToken 획득 기능으로 카카오 AccessToken을 획득
			OAuth2AccessToken accessToken =  oauthService.getAccessToken(code);
			return accessToken;
		}
		return null;		
	}
	
	//Access Token을 이용하여 카카오 사용자 프로필 api를 호출
	public String getUserProfile(OAuth2AccessToken oauthToken) throws Exception {
		log.info("getUserProfile 호출!");
		
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(kakaoClientId)
				.apiSecret(kakaoClientSecret)
				.callback(kakaoRedirectUrl)
				.build(KakaoOAuthApi.instance());
		OAuthRequest request = new OAuthRequest(Verb.GET, profileApiUrl, oauthService);
		oauthService.signRequest(oauthToken, request);
		Response response = request.send();
		
		return response.getBody();
	}
	
	private String generateRandomString() {
		return UUID.randomUUID().toString();
	}
}























