# UserMan3
A sample project for DBP class in 2021
based on MVC architecture
- adding community functionalities

__Branches__
 
- master (default)
- UserMan3a - using Ajax & REST contoller
- UserMan3b - using Bootstrap 
- UserMan3m - using MyBatis
 
#### master branch
__UserMan2 update로부터 변경된 클래스 및 JSP__

- controller.RequestMapping -  _request mapping 정보 수정 및 추가_
- controller.comm.* -  _추가 (커뮤니티 기능 관련 컨트롤러들)_
- controller.user.RegisterUserController -  _커뮤니티 id 처리 추가_

- model.User -  _커뮤니티 id 필드 추가_
- model.Community -  _추가_
- model.dao.UserDao -  _커뮤니티 소속 사용자 검색 메소드들 추가_
- model.dao.CommunityDao -  _추가_
- model.dao.ConnectionManager -  _DB 접속 설정 외부화: context.properties 파일 이용_
- model.dao.JDBCUtil -  _Sequence를 이용한 PK 값 생성 시 생성된 값 확인을 위한 메소드 추가_
- model.service.UserManager -  _커뮤니티 관련 기능 추가_

- resources/context.properties -  _추가 (DB 접속 설정 값 정의)_
- resources/schema.sql -  _커뮤니티 관련 DB 테이블 & 레코드 정의 추가_

- 모든 JSP를 WEB-INF 폴더 아래로 이동
- /css/community.css -  _추가 (커뮤니티 관련 style 정의)_
- /WEB-INF/community/*.jsp -  _추가 (커뮤니티 관련 view pages)_
- /WEB-INF/user/list.jsp -  _list2.jsp와 동일 (JSTL + EL 활용 구현), 회원가입 링크에 대한 URI 변경_
- /WEB-INF/user/loginForm.jsp -  _회원가입 링크에 대한 URI 변경_
- /WEB-INF/user/registerForm.jsp -  _커뮤니티 선택을 위한 select 메뉴 추가_
- /WEB-INF/user/updateForm.jsp -  _커뮤니티 선택을 위한 select 메뉴 추가_
- /WEB-INF/user/view.jsp -  _커뮤니티 이름 및 링크 추가_

#### Eclipse에서 local repository(clone)를 생성하고 project를 import하는 방법 

(주의: 먼저 Github(<https://github.com>)에 로그인한 후 본 리파지토리(<https://github.com/cspark0/UserMan3>)에 접속해서 우측 상단의 Fork 버튼을 이용하여 본인의 계정으로 복제함)

1. File 메뉴 > Import... > Git | Projects from Git 
2. Clone URI 
3. fork된  URI 입력(예: https://github.com/your_Github_username/UserMan3.git), user & password 값 입력 
4. branch를 모두 선택
5. 생성할 local repository 경로 입력(예: C:\Users\사용자\git\UserMan3)
6. 첫번째 옵션 "Importing existing Eclipse projects" 선택 >> Finish   
  
  
처음에 import되는 프로젝트는 master branch이며, 다른 branch의 프로젝트를 import하거나 서로 전환하기 위해서는 다음과 같은 방법을 이용함


1. Git Perspective 실행(툴바 오른쪽 상단의 Open Perspective 아이콘에서 Git 항목 선택)  
2. Git Repositories 창에서 UserManager > Branches > Remote Tracking 아래에 있는 branch들 중 원하는 branch를 선택해서 더블클릭
3. Checkout as New Local Branch 실행   
4. Java EE perspective로 전환하여 checkout된 프로젝트 이용
 
 
Local 아래의 다른 branch로 전환하려면 그 branch 이름을 더블클릭하여 checkout하거나, 
Java EE perspective의 Project Explorer 창에서 프로젝트 이름을 마우스 우클릭한 후 Team > Switch To > branch 이름을 선택함  
       
  
### 참고: Git 사용법 

- 윤웅식, 만들면서 배우는 Git+GitHub 입문, 한빛미디어, 2015.  
- 오오츠카 히로키, 소셜 코딩으로 이끄는 GitHub 실천 기술, 제이펍, 2015.  
- <https://backlog.com/git-tutorial/kr/>  
- <https://nolboo.kim/blog/2013/10/06/github-for-beginner/> 및 링크된 문서들  
- <http://itmir.tistory.com/461>  
- <http://jwgye.tistory.com/38?category=689862>  
- 온라인 자료들  
