# UserMan3
Sample project for DBP class
based on MVC architecture
- adding community functionalities

### UserMan3a branch
- branched from *master*
- adding Ajax calls to the REST controllers returning JSON text  

__master branch로부터 변경된 클래스 및 JSP__

- controller.RequestMapping --  _request mapping 정보 수정 및 추가_
- controller.comm.ListCommunityController를 ListAndViewCommunityController로 교체 -- _/WEB-INF/community/listAndView.jsp를 뷰로 선택함_
- controller.comm.ListCommunityJsonController 추가 --  _커뮤니티 리스트 검색 결과를 JSON 형식으로 반환_
- controller.comm.ViewCommunityJsonController 추가 --  _특정 커뮤니티 정보 검색 결과를 JSON 형식으로 반환_

- /WEB-INF/user/registerForm.jsp --  _커뮤니티 목록 메뉴 생성을 위해 ListCommunityJsonController에 대한 Ajax 호출 실행_
- /WEB-INF/community/list.jsp를 listAndView.jsp로 교체 --  _선택된 커뮤니티의 상세 정보와 회원 정보를 출력하기 위해 ViewCommunityJsonController에 대한 Ajax 호출 실행_
 