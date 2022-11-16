# UserMan3
Sample project for DBP class
based on MVC architecture
- adding community functionalities
 
### UserMan3c branch
- branched from *UserMan3b*
- using *MyBatis* to implement Community DAO
 
__UserMan3b branch로부터 변경된 파일__
 
- pom.xml <span style="color:blue">-- MyBatis dependency 설정 추가</span>
- resources/mybatis-config.xml <span style="color:blue">-- MyBatis 설정 파일</span>
- resources/model/dao/mybatis/mapper/CommunityMapper.xml <span style="color:blue">-- Mapper XML</span>
- model.dao.mybatis.mapper.CommunityMapper.java <span style="color:blue">-- Mapper interface</span> 
- model.dao.mybatis.CommunityDAO <span style="color:blue">-- SqlSession 및 CommunityMapper 이용</span>
- model.service.UserManager <span style="color:blue">-- findCommunity() 메소드 수정(CommunityDAO#findCommunityWithMembers() 호출)</span>
- model.{Community, User} <span style="color:blue">-- implements Serializable interface</span>  

        
       