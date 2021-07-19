# WHOEVER
JSP를 이용한 KPU 정보공유 사이트

### 0. 개요
------------------------------
1. 프로젝트 필요성
![image](https://user-images.githubusercontent.com/48792627/126115168-a6768ff2-b4bd-46ee-9c26-8239be842a8e.png)


2. 프로젝트 기능

       - 태그 : 사용자의 관심에 따라 태그로 분류하여 사용자의 편의성 제공 
       
       - 채팅 :  관심사를 공유하기 위한 목적으로 들어온 사용자들끼리, 채팅 기능을 제공하여 목적에 따라 자유롭게 정보를 주고받을 수 있음
       
       - 검색 : 게시판에 포함되는 내용과 태그, 작성자 등의 분류로 목적에 맞는 사용자들을 찾을 수 있음



### 1. 사용 프로그램
------------------------------

       - 코드공유 : GITHUB
       
       - 구현 :  eclipse, JAVA
       
       - 협업도구 : Discord, ERDCloud
       
       - DB : mysql
       

### 2. jsp 페이지 동작 과정
------------------------------

![image](https://user-images.githubusercontent.com/48792627/126115654-2eecd0af-ba93-4ffd-9277-17e24a36dea6.png)

JDBC로 데이터베이스와 JSP 연동



![image](https://user-images.githubusercontent.com/48792627/126115735-91dce5dc-723c-4561-981e-c2c1117a93bc.png)

WebSocket을 사용한 채팅 구현
 
### 3. 기능 소개
------------------------------

1. 로그인
1-1) 로그인 기능
1-2) 회원가입 기능
1-3) 마이페이지
1-3-가) 프로필 사진
1-3-나) 정보 수정


2. 게시판
2-1) 게시판 CRUD 기능 
2-2) 게시글 읽기
2-2-가) 전체 게시글 읽기
2-2-나)  내가 쓴 글 읽기


3. 검색
3-1) 내용 검색 기능
3-2) 태그 검색 기능
3-2-가) 태그 다중 검색 기능
3-3) 작성자 검색 기능
3-4) 제목 검색 기능
3-5) 전체 검색 기능

4. 채팅
4-1) 채팅방 생성 및 입장
4-2) 채팅 내역 저장 및 확인
4-3) 채팅방 삭제
4-4) 채팅방 제약사항       

 
### 4. 실행 화면
------------------------------
# 메인 페이지

![image](https://user-images.githubusercontent.com/48792627/126116606-1785833e-bba2-4a52-8e91-5992e4aa055d.png)

* 내용 검색 기능
작성자, 내용, 태그 등을 검색 원하는 목적 달성 가능
 
* 전체 글 조회 및 검색
게시글 클릭 시 로그인이 되지 않았으면 로그인 페이지로 이동




# 로그인 페이지

![image](https://user-images.githubusercontent.com/48792627/126116700-6f99e19e-0a1e-443c-865a-58832399089f.png)

* 로그인 기능
사용자의 이메일 주소와 비밀번호입력 받아 DB와 비교 후 로그인
로그인 성공 시 main page로 세션유지
  
* 회원 가입 기능
등록된 사용자가 아닐 경우 회원가입 버튼을 눌러 회원가입 페이지로 이동




# 회원가입 페이지

![image](https://user-images.githubusercontent.com/48792627/126116774-82b0dbf1-7c74-4832-ba66-cecbe750ebfa.png)

* 이메일 인증
@kpu.ac.kr 의 형식의 이메일을 입력해야 함
이메일로 발송된 인증코드를 입력하여 인증
 
* 아이디 및 이메일 중복 확인
DB에 등록된 아이디와 이메일이 있는지 중복 확인


* 비밀번호, 아이디 유효성 검사
8~16자 영문 대 소문자, 숫자로 구성되어 있는지 확인  




# 프로필

![image](https://user-images.githubusercontent.com/48792627/126116898-dab87199-d266-41e2-858b-5f8977e5f16a.png)

* 프로필 사진 
프로필 사진을 업로드 및 삭제  

* 정보 변경
기존 패스워드 입력하여 일치 시 이름 및 비밀번호 변경

* 자기소개 메시지 수정
텍스트 입력 창에 자기 소개 메시지 입력하여 저장 및 수정




# 게시판 글 작성

![image](https://user-images.githubusercontent.com/48792627/126116964-502f542c-807e-4ba3-8da1-a6cdc15a9ff7.png)

* 구성
직접 입력하는 키워드, 제목, 태그, 내용 외에도 작성시간, id, 존재유무 판단 플래그

* 글쓰기
글 쓰기 버튼 클릭 시
작성한 내용과 게시글을 판별하는 id가 자동으로 생성




# 게시글 상세보기

![image](https://user-images.githubusercontent.com/48792627/126117076-1147f826-c675-485e-a291-cc36ea87a59a.png)

* 글 상세보기
사용자들이 올린 게시글에 대한 정보를 자세히 볼 수 있음
제목, 작성자, 태그, 작성일자, 키워드, 내용 등

* 채팅 참가
참가하기 버튼을 눌러 작성자가 만든 채팅방에 참여할 수 있음

* 글 수정 및 삭제
작성자의 글일 경우 수정 및 삭제 가능



# 게시글 수정

![image](https://user-images.githubusercontent.com/48792627/126117144-fa44a005-04e8-4bbb-9acb-08a79a6fa5f2.png)

* 구성
게시글 쓰기와 구성이 동일하며 
해당 게시글의 내용을 불러와 수정할 수 있도록 함

* 수정
글 쓰기 버튼 클릭 시 수정한 내용으로 해당 게시글의 내용이 수정되며 DB 업데이트 
 
 

# 내가 작성한 글 목록

![image](https://user-images.githubusercontent.com/48792627/126117231-1f51b226-5d45-4f8f-9cd8-9898a72bc6f7.png)

* 글 목록
로그인 된 사용자의 게시글 중 활성화된 게시글 목록 출력

* 글 상세 보기
해당 글에 대한 상세 정보를 볼 수 있음

* 글 수정 및 삭제
사용자의 글을 수정 및 삭제



# 채팅 기능

![image](https://user-images.githubusercontent.com/48792627/126117330-227e0e12-5006-4590-b9b6-7ab761a5b259.png)

* 채팅방
게시글을 통해 입장하며 입장된 채팅방에 재입장 시 우측 상단 navigation bar를 통해 입장 가능
입장제한 인원 이상 참여 불가 및 대화내용 DB 저장

* 실시간 채팅
 Websocket을 통해 접속 유지 시 메시지 실시간으로 확인 가능

* 생성 및 삭제
게시글의 생성 및 삭제와 동시에 채팅방이 생성 및 삭제



