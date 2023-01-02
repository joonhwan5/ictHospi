# 🏥ictHospital

▶ [22.12.22 : 주제정하기](#-221222-) <br/>
▶ [22.12.23 : 와이어프레임](#-221223-) <br/>
▶ [22.12.26 : 간단한 DB설계!!!!](#-221226-) <br/>
▶ [22.12.27 : git, ERD 작업](#-221227-) <br/>
▶ [22.12.28 : ERD 테이블 추가, 식별 작업 마무리](#-221228-) <br/>
▶ [22.12.29 : STS, 작업환경](#-221229-) <br/>
▶ [22.12.30 : Spring](#-221230-) <br/>

# [ 22.12.22 ]

프로젝트 : 프로젝트 1일차

참가자: 김준환, 김주영, 임도영, 고득환, 임지훈

## 회의 주제 : 프로젝트 정하기

## 세부내용

### 조원들의 프로젝트 주제 발표

* 병원을 추천하는 사이트, 종합병원 사이트, 쇼핑몰 등의 의견이 나옴
* 진료예약과 영양제, 보조기구 판매가 가능한 종합 병원 사이트로 선정

## 결론

### 주제선정
> ICTHospital

## 다음회의

와이어프레임 

⏏[맨위로](#icthospital) <br/>

---

# [ 22.12.23 ]

프로젝트 : 프로젝트 2일차

참가자 : 김준환, 김주영, 임도영, 고득환, 임지훈

## 회의 주제 : 와이어프레임

## 세부내용

### 와이어프레임

* 1일차 회의에서 나온 주제를 토대로 와이어프레임 작성
* 길병원, 구로고대병원 등의 사이트를 참고
* 간단한 와이어프레임 작성 후 HTML 설정

### Ovenapp.io를 이용한 간단한 와이어프레임
![oven-main-page](https://user-images.githubusercontent.com/28111321/209935512-2905ab56-a4f0-4fb5-90a2-023239b95d11.png)

![oven-login-page](https://user-images.githubusercontent.com/28111321/209938340-92f4eea9-05d4-4854-8d25-2f169c68e52e.png)

![oven-join-page](https://user-images.githubusercontent.com/28111321/209938657-9fbd5eeb-7647-4633-9b1c-25065d2e36fe.png)

## 결론

와이어프레임을 구성하면서 오븐이 화면을 상세하게 구현하기에는 부족하다고 생각함

## 다음회의
간단한 DB설계와 추가 와이어프레임 작업

⏏[맨위로](#icthospital) <br/>

---

# [ 22.12.26 ]

프로젝트 : 프로젝트 3일차

참가자 : 김준환, 김주영, 임도영, 고득환, 임지훈

## 회의 주제 : 간단한 DB설계와 추가 와이어프레임 작업

## 세부내용

### 백엔드 작업 이전 DB 설계

* 현재 만들어진 페이지에서 필요한 DB를 찾기
* 사용한 프로그램 ERDCloud

![Hospital](https://user-images.githubusercontent.com/28111321/209946927-501f711b-0cef-405a-85cd-7c0e8de18071.png)

회원, 의사, 고객의 소리, 공지사항, 식단 DB테이블 작성

## 결론

### ERDCloud
> 현재 만들어진 와이어프레임을 기반으로 만든 테이블이기 때문에 
> 추가, 삭제, 수정이 있을 예정

## 다음 회의

DB 설계 및 간단한 HTML Page, ERD 작성

⏏[맨위로](#icthospital) <br/>

---

# [ 22.12.27 ]

프로젝트 : 프로젝트 4일차

참가자 : 김준환, 김주영, 임도영, 고득환, 임지훈

## 회의 주제: git, ERD 작업

## 세부 내용

* git 사용법 공부
* ERD 식별관계 추가

Mac OS bash status
![macosbash](https://user-images.githubusercontent.com/28111321/210023161-d0743deb-491f-4cdc-9e3e-a4eb3c53d20b.png)

### 백엔드 작업 이전 DB 설계

* ERD

![ERD식별관계](https://user-images.githubusercontent.com/28111321/210022754-8c587620-d8fb-4262-a322-686d0aee541a.png)

## 결론

* 아직 git의 add, commit, push, pull, clone, merge에 익숙하지 않음
* ERD 작업이 거의 마무리

⏏[맨위로](#icthospital) <br/>

---

# [ 22.12.28 ]

프로젝트 : 프로젝트 5일차

참가자 : 김준환, 김주영, 임도영, 고득환, 임지훈

## 회의 주제: ERD 테이블 추가, 식별 작업 마무리

## 세부 내용

* 총 11개의 TABLE과 9개의 SEQUENCE가 나왔다.
* 유저, 관리자, 공지사항, 의사, 예약 등의 TABLE과 특정 TABLE에서 기본키 역할을 해줄 SEQUENCE

## 문제 발생

* git bash를 이용해서 merge를 하는 도중 conflict 발생
> Visual Studio Code에서 Git Graph와 GitLens를 설치 -> 눈에 보이지 않던 merge가 그래프로 보여서 편함

![Screenshot 2023-01-01 at 10 59 43 PM (2)](https://user-images.githubusercontent.com/28111321/210173253-02a6af82-ef43-4464-a47a-58c9225a4d65.png)

## 결론
* Visual Studio Code를 통해 쉽게 merge가 가능해졌다.

⏏[맨위로](#icthospital) <br/>

---

# [ 22.12.29 ]

프로젝트 : 프로젝트 6일차

참가자 : 김준환, 김주영, 임도영, 고득환, 임지훈

## 개발 환경

Spring Tool Suite 3 version 사용
spring mvc2 구조로 controller, service, dto 작성

- dto는 myBatis를 사용하여 mapper로 작성

> myBatis, hikari, junint, lombok 등의 라이브러리를 사용

## 진도현황

값을 받을 수 있는 VO Class 작성

> UserVO, AdminVO, ClaimVO....

Controller 작성

> UserController, AdminController, ClaimController, IntroController....

⏏[맨위로](#icthospital) <br/>

---

# [ 22.12.30 ]

프로젝트 : 프로젝트 7일차

참가자 : 김준환, 김주영, 임도영, 고득환, 임지훈

## 진도현황

메인화면 이동 시 로그인, 회원가입 

⏏[맨위로](#icthospital) <br/>


