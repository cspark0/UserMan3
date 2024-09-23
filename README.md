# UserMan3
Sample project for DBP class
based on MVC architecture
- adding community functionalities

__Branches__
 
- master <span style="color:blue">(default)</span>
- UserMan3a - using REST contollers & Ajax
- UserMan3b - using Bootstrap
- UserMan3c - using MyBatis 
 
### master branch
__UserMan2u branch로부터 변경된 클래스 및 JSP__

- controller.DispatcherServlet --  _/WEB-INF 폴더 아래에 위치한 JSP로 forwarding 실행_
- controller.RequestMapping --  _request mapping 정보 수정 및 추가_
- controller.comm.* 추가 --  _커뮤니티 기능 관련 컨트롤러들_
- controller.user.RegisterUserController --  _회원 가입을 위한 폼 요청 및 가입 요청 처리(폼에 커뮤니티 리스트 전달), 커뮤니티 id 파라미터 처리_
- controller.user.UpdateUserController --  _회원 정보 수정을 위한 폼 요청 및 수정 요청 처리(폼에 사용자 정보 및 커뮤니티 리스트 전달), 커뮤니티 id 파라미터 처리_

- model.domain.User --  _커뮤니티 id 필드 추가_
- model.domain.Community 추가
- model.dao.UserDao --  _커뮤니티 소속 사용자 검색 메소드들 추가_
- model.dao.CommunityDao 추가
- model.dao.ConnectionManager --  _DB 접속 설정 외부화: context.properties 파일 이용_
- model.dao.JDBCUtil --  _Sequence를 이용한 PK 값 생성 시 생성된 값 확인을 위한 메소드 추가_
- model.service.UserManager --  _커뮤니티 관련 기능 추가_

- resources/context.properties 추가 --  _DB 접속 설정 값 정의_
- resources/schema.sql --  _커뮤니티 관련 DB 테이블 & 레코드 정의 추가_

- 모든 JSP를 /WEB-INF 폴더 아래로 이동 (외부로부터 요청 차단)
- /css/community.css 추가 --  _커뮤니티 관련 style 정의_
- /WEB-INF/community/*.jsp 추가 --  _커뮤니티 관련 view pages_
- /WEB-INF/user/list.jsp --  _list2.jsp와 동일 (JSTL + EL 활용 구현), 회원가입 링크에 대한 URI 변경_
- /WEB-INF/user/loginForm.jsp --  _회원가입 링크에 대한 URI 변경_
- /WEB-INF/user/registerForm.jsp --  _커뮤니티 선택을 위한 select 메뉴 추가_
- /WEB-INF/user/updateForm.jsp --  _커뮤니티 선택을 위한 select 메뉴 추가_
- /WEB-INF/user/view.jsp --  _커뮤니티 이름 및 링크 추가_

### Eclipse에서 local repository를 생성하고 project를 import하는 방법 
 
1. File 메뉴 > Import... > Git | Projects from Git (with smart import) 선택
2. Clone URI 선택
3. repository의 URI 입력: https://github.com/cspark0/UserMan3.git
4. master branch (또는 모든 branch) 선택
5. 생성할 local repository 경로 확인 또는 변경 (예: C:\Users\사용자\git\UserMan3) 
6. 다음 화면(Imports project ...)에서 Finish
7. 프로젝트가 import되었는지 확인하고 프로젝트가 빌드 완료될 때까지 기다림
8. 오류가 표시되어 있으면 Maven > Update project.. 실행 (Alt+F5)
  
처음에 import되는 프로젝트는 master branch이며, 다른 branch의 프로젝트를 import하거나 서로 전환하기 위해서는 다음과 같은 방법을 이용함


1. Git Perspective 실행(툴바 오른쪽 상단의 Open Perspective 아이콘에서 Git 항목 선택)  
2. Git Repositories 창에서 UserManager > Branches > Remote Tracking 아래에 있는 branch들 중 원하는 branch를 선택해서 더블클릭
3. Checkout as New Local Branch 실행   
4. Java EE perspective로 전환하여 checkout된 프로젝트 이용
 
 
Local 아래의 다른 branch로 전환하려면 그 branch 이름을 더블클릭하여 checkout하거나, 
Java EE perspective의 Project Explorer 창에서 프로젝트 이름을 마우스 우클릭한 후 Team > Switch To > branch 이름을 선택함  
       
