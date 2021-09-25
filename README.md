# UserMan3
A sample project for DBP class in 2021
based on MVC architecture
- including community management functionalities

#### Branches
 
- master (default)
- UserMan3a - using Ajax
- UserMan3b - using Bootstrap 
- UserMan3m - using MyBatis
 
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
