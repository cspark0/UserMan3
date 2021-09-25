# UserMan3
A sample project for DBP class in 2021
based on MVC architecture
- adding community functionalities

### UserMan3a branch
- branched from master
- adding Ajax calls to the REST controllers returning JSON text  

__master branch로부터 변경된 클래스 및 JSP__

- controller.RequestMapping -  _request mapping 정보 수정 및 추가_
- controller.comm.ListCommunityController -  _ListAndViewCommunityController로 교체 (/community/listAndView.jsp를 뷰로 선택)_
- controller.comm.ListCommunityJsonController -  _추가 (커뮤니티 리스트 검색 결과를 JSON 형식으로 반환)_
- controller.comm.ViewCommunityJsonController -  _추가 (특정 커뮤니티 정보 검색 결과를 JSON 형식으로  반환)_

- /user/registerForm.jsp -  _ListCommunityJsonController에 대한 Ajax 호출 추가_
- /community/list.jsp -  _/community/listAndView.jsp로 교체 (ViewCommunityJsonController에 대한 Ajax 호출 실행)_
 