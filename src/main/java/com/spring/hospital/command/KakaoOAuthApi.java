package com.spring.hospital.command;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class KakaoOAuthApi extends DefaultApi20 {

	private static class InstanceHolder {
		private static final KakaoOAuthApi INSTANCE = new KakaoOAuthApi();
	}
	
	public static KakaoOAuthApi instance() {
		return InstanceHolder.INSTANCE;
	}
	
	// 카카오 인증 서버에 접근 권한 토큰을 얻기 위해서 작성되어야할 url을 함수 반환값으로 설정.
	@Override
	public String getAccessTokenEndpoint() {
		return "https://kauth.kakao.com/oauth/token";
	}

	// 카카오 인증 서버에 사용자 권한을 얻기 위해서 작성되어야할 url을 함수 반환값으로 설정.
	@Override
	protected String getAuthorizationBaseUrl() {
		return "https://kauth.kakao.com/oauth/authorize";
	}
	
}
