#  나는 오늘도 너 몰래 공부한다


<p align="center">
  <img src="https://github.com/user-attachments/assets/455380d2-4632-4407-b5e9-5a3455831d5b" alt="프로젝트 메인 이미지" width="700" />
</p>

---

## 👋 소개

> 함께 공부하고 성장하는 **온라인 학습 커뮤니티 플랫폼**  

#### 선정 배경
1. **비대면 & 대면 학습이 혼재된 환경** 속에서 자기주도 학습의 어려움과 학습 동기 부족 문제가 지속됨  
2. 온라인에서 **학습 의지 공유·협력·소통**이 가능한 웹 플랫폼의 필요성을 인식  
3. 사용자가 **스터디를 자유롭게 개설·참여**하고, 커뮤니티와 **실시간 알림**을 통해 꾸준한 학습 참여를 유도하고자 함
4. 단순 스터디 모집을 넘어, **커뮤니티·일정 관리·알림**을 한 곳에서 제공하는 통합형 학습 지원 플랫폼을 목표로 했습니다.



---

## 🛠 개발 환경

### 개발 언어
<img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/css3-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> <img src="https://img.shields.io/badge/servlet-5C2D91?style=for-the-badge&logo=java&logoColor=white">


### 프레임워크 & 라이브러리
<img src="https://img.shields.io/badge/MyBatis-000000?style=for-the-badge&logo=mybatis&logoColor=white"> <img src="https://img.shields.io/badge/JSTL-006400?style=for-the-badge&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/WebSocket-512BD4?style=for-the-badge&logo=websocket&logoColor=white"> <img src="https://img.shields.io/badge/AJAX-1C1C1C?style=for-the-badge&logo=javascript&logoColor=white"> <img src="https://img.shields.io/badge/JSP-61DAFB?style=for-the-badge&logo=jsp&logoColor=black">


### 개발 도구
<img src="https://img.shields.io/badge/eclipse-2C2255?style=for-the-badge&logo=eclipse&logoColor=white"> <img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white"> <img src="https://img.shields.io/badge/apache%20tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">


### 아키텍처
<img src="https://img.shields.io/badge/MVC%20Pattern-232F3E?style=for-the-badge&logoColor=white"> <img src="https://img.shields.io/badge/Controller-00599C?style=for-the-badge&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/Service-6DB33F?style=for-the-badge&logo=spring&logoColor=white"> <img src="https://img.shields.io/badge/DTO-FF6F00?style=for-the-badge&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/Mapper-4B8BBE?style=for-the-badge&logo=mybatis&logoColor=white">



---

## 🗄️ 테이블 구조


- `USERS` : 회원 기본 정보 및 상태 관리
- `STUDY_GROUP` : 스터디 그룹 정보
- `STUDY_MEMBER` : 스터디 참여자 및 역할
- `STUDY_NOTICE` : 스터디 공지사항
- `STUDY_COMMENT` : 스터디 공지 댓글
- `POSTS` : 커뮤니티 게시글
- `COMMENTS` : 커뮤니티 댓글
- `POST_LIKES` : 게시글 좋아요
- `SCRAPS` : 게시글 스크랩
- `NOTIFICATIONS` : 알림
- `REPORTS` : 신고 내역
- `TODO_LIST` : 개인 학습 일정 관리
- `STUDY_STATS` / `STUDY_TIMER` : 공부 시간 통계 및 타이머

<p align="center">
  <img src="https://github.com/user-attachments/assets/2차_usertable.png" alt="테이블 구조 ERD" width="900" />
</p>

---


## 🖥 화면 구성


| 과목별 공부 시간 | TODO LIST |
|------------------|-----------|
| <img src="https://github.com/user-attachments/assets/study-time.png" width="400" alt="과목별 공부 시간 화면"> | <img src="https://github.com/user-attachments/assets/todo-list.png" width="400" alt="TODO LIST 화면"> |

| 캘린더 조회 | 날짜 조회 |
|-------------|------------------|
| <img src="https://github.com/user-attachments/assets/calendar.png" width="400" alt="캘린더 조회 화면"> | <img src="https://github.com/user-attachments/assets/study-group.png" width="400" alt="스터디 그룹 모집 화면"> |

| 스터디 그룹 모집 | 커뮤니티 게시판 |
|-----------------|-----------|
| <img src="https://github.com/user-attachments/assets/community.png" width="400" alt="커뮤니티 게시판 화면"> | <img src="https://github.com/user-attachments/assets/mypage.png" width="400" alt="마이페이지 화면"> |

| 마이페이지 |
|-----------|
| <img src="https://github.com/user-attachments/assets/admin.png" width="400" alt="관리자 홈 화면"> |


---

## ✨ 주요 기능

- **회원 관리**
  - 사용자 회원가입, 로그인, 회원 정보 수정 및 탈퇴

- **커뮤니티 기능**
  - 게시글, 댓글 CRUD (작성/수정/삭제)
  - 좋아요 및 실시간 알림
  - 스크랩 기능 제공

- **스터디 기능**
  - 스터디 생성, 조회, 가입, 탈퇴, 삭제
  - 스터디 기간 수정 및 종료 관리

- **학습 통계 기록**
  - 개인별 공부 시간 기록
  - TODO LIST와 연동하여 학습 데이터를 캘린더 형태로 시각화

- **할 일 관리 및 타이머**
  - 목표 설정 및 마감일 관리
  - 진행 상태 체크 (Todo, Timer 기능 연동)

- **관리자 기능**
  - 회원 목록 조회 및 관리
  - 게시글/댓글 신고 처리 및 신고 내역 확인
  - 사용자 정지 및 제재 처리

---  

## 💡 마무리

### 배운 점
- JSP/Servlet 기반 MVC 웹 개발 실습을 통해 웹 애플리케이션 구조를 이해하고 적용할 수 있게 됨  
- MyBatis를 활용한 데이터베이스 연동 및 쿼리 매퍼 관리 방법을 익힘  
- MVC 구조 설계와 웹소켓을 통한 실시간 통신 구현 경험을 쌓음  
- 커스텀 AJAX 호출과 JSON 응답 처리 과정을 직접 설계하고 구현함  

### 추가적으로 구현한 / 구현하고 싶은 기능
- 정지 회원의 게시글 및 댓글 블라인드 처리  ( ✅ **구현 완료** )
- 신고 사유(카테고리) 세분화 및 관리 기능 추가  
- 동일한 대상에 대한 중복 신고 방지 로직 구현  

### 회고
- 지금까지 학습한 기술들을 프로젝트에 적용하며 실무 감각을 익히고 이해를 깊게 할 수 있었음  
- 설계 단계에서 전체 구조, 역할 분담, 데이터 흐름을 **사전에 명확히 계획하는 것**이 매우 중요하다는 점을 깨달음  
- 예외 처리와 코드 리팩토링 등 세부적인 완성도를 높이지 못한 부분이 아쉬움으로 남음  






