package model.dao.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Community;

/**
 * 사용자 관리를 위해 데이터베이스 작업을 전담하는 DAO 클래스
 * Community 테이블에서 커뮤니티 정보를 추가, 수정, 삭제, 검색 수행 
 */
public class CommunityDAOJdbcImp {
	private JDBCUtil jdbcUtil = null;
	
	public CommunityDAOJdbcImp() {			
		jdbcUtil = new JDBCUtil();	// JDBCUtil 객체 생성
	}
		
	/**
	 * 커뮤니티 테이블에 새로운 행 생성 (PK 값은 Sequence를 이용하여 자동 생성)
	 */
	public Community create(Community comm) throws SQLException {
		String sql = "INSERT INTO Community VALUES (commId_seq.nextval, ?, ?, SYSDATE, ?)";		
		Object[] param = new Object[] {comm.getName(), comm.getDescription(),
			comm.getChairId()};				
		jdbcUtil.setSqlAndParameters(sql, param);	// JDBCUtil 에 insert문과 매개 변수 설정
						
		String key[] = {"cId"};	// PK 컬럼의 이름     
		try {    
			jdbcUtil.executeUpdate(key);  // insert 문 실행
		   	ResultSet rs = jdbcUtil.getGeneratedKeys();
		   	if(rs.next()) {
		   		int generatedKey = rs.getInt(1);   // 생성된 PK 값
		   		comm.setId(generatedKey); 	// id필드에 저장  
		   	}
		   	return comm;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.commit();
			jdbcUtil.close();	// resource 반환
		}		
		return null;			
	}

	/**
	 * 기존의 커뮤니티 정보를 수정
	 */
	public int update(Community comm) throws SQLException {
		String sql = "UPDATE Community "
					+ "SET cName=?, descr=?, chairId=? "
					+ "WHERE cId=?";
		String chairId = comm.getChairId();
		if (chairId.equals("")) chairId = null;
		Object[] param = new Object[] {comm.getName(), comm.getDescription(),
				chairId, comm.getId()};				
		jdbcUtil.setSqlAndParameters(sql, param);	// JDBCUtil에 update문과 매개 변수 설정
			
		try {				
			int result = jdbcUtil.executeUpdate();	// update 문 실행
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource 반환
		}		
		return 0;
	}

	/**
	 * 커뮤니티의 회장을 변경  
	 */
	public int updateChair(Community comm) {
		String sql = "UPDATE Community "
					+ "SET chairId= ? "
					+ "WHERE cId=?";
		Object[] param = new Object[] {comm.getChairId(), comm.getId()};				
		jdbcUtil.setSqlAndParameters(sql, param);	// JDBCUtil에 update문과 매개 변수 설정
			
		try {				
			int result = jdbcUtil.executeUpdate();	// update 문 실행
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource 반환
		}		
		return 0;
	}
	
	/**
	 * 주어진 ID에 해당하는 커뮤니티 정보를 삭제.
	 */
	public int remove(String commId) throws SQLException {
		String sql = "DELETE FROM Community WHERE cId=?";		
		jdbcUtil.setSqlAndParameters(sql, new Object[] {commId});	// JDBCUtil에 delete문과 매개 변수 설정

		try {				
			int result = jdbcUtil.executeUpdate();	// delete 문 실행
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource 반환
		}		
		return 0;
	}

	/**
	 * 주어진  ID에 해당하는 커뮤니티 정보를 데이터베이스에서 찾아 Community 도메인 클래스에 
	 * 저장하여 반환.
	 */
	public Community findCommunity(int commId) throws SQLException {
        String sql = "SELECT cName, descr, startDate, chairId, u.name As chairName "
        			+ "FROM Community c LEFT OUTER JOIN UserInfo u ON c.chairId = u.userId "
        			+ "WHERE cId=? ";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {commId});	// JDBCUtil에 query문과 매개 변수 설정
		Community comm = null;
		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query 실행
			if (rs.next()) {						// 학생 정보 발견
				comm = new Community(		// Community 객체를 생성하여 커뮤니티 정보를 저장
					commId,
					rs.getString("cName"),
					rs.getString("descr"),
					rs.getDate("startDate"),
					rs.getString("chairId"),
					rs.getString("chairName"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return comm;
	}

	/**
	 * 전체 커뮤니티 정보를 검색하여 List에 저장 및 반환
	 */
	public List<Community> findCommunityList() throws SQLException {
        String sql = "SELECT cId, cName, descr, COUNT(u.userId) AS numOfMem "
        		   + "FROM Community c LEFT OUTER JOIN UserInfo u ON c.cId = u.commId "
        		   + "GROUP BY cId, cName, descr "
        		   + "ORDER BY cName";        
		jdbcUtil.setSqlAndParameters(sql, null);		// JDBCUtil에 query문 설정
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();			// query 실행			
			List<Community> commList = new ArrayList<Community>();	// Community들의 리스트 생성
			while (rs.next()) {
				Community comm = new Community(			// Community 객체를 생성하여 현재 행의 정보를 저장
						rs.getInt("cId"),
						rs.getString("cName"),
						rs.getString("descr"),
						rs.getInt("numOfMem"));
				commList.add(comm);				// List에 Community 객체 저장
			}		
			return commList;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}
	
	/**
	 * 주어진  ID에 해당하는 커뮤니티가 존재하는지 검사 
	 */
	public boolean existingCommunity(String commId) throws SQLException {
		String sql = "SELECT count(*) FROM Community WHRE cId=?";      
		jdbcUtil.setSqlAndParameters(sql, new Object[] {commId});	// JDBCUtil에 query문과 매개 변수 설정

		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query 실행
			if (rs.next()) {
				int count = rs.getInt(1);
				return (count == 1 ? true : false);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return false;
	}
}
