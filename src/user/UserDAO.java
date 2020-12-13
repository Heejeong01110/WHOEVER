package user;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import javax.naming.NamingException;


public class UserDAO {
	private static UserDAO instance;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private UserDAO(){}
    public static UserDAO getInstance(){
        if(instance==null)
            instance=new UserDAO();
        return instance;
    }
    public void insertMember(User user) throws SQLException
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            // 커넥션을 가져온다.
            conn = DBConnection.getConnection();
            
            // 자동 커밋을 false로 한다.
            conn.setAutoCommit(false);
            
            // 쿼리 생성한다.
            StringBuffer sql = new StringBuffer();
            /* 
             * StringBuffer에 담긴 값을 얻으려면 toString()메서드를
             * 이용해야 한다.
             */
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(2, user.getUserName());
            pstmt.setString(3, user.getUserID());
            pstmt.setString(4, user.getUserPassword());
            pstmt.setString(5, user.getUserEmail());
            
            // 쿼리 실행
            pstmt.executeUpdate();
            // 완료시 커밋
            conn.commit(); 
            
        } catch (ClassNotFoundException | NamingException | SQLException sqle) {
            // 오류시 롤백
            conn.rollback(); 
            
            throw new RuntimeException(sqle.getMessage());
        } finally {
            // Connection, PreparedStatement를 닫는다.
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        } // end try~catch 
    } // end insertMember()

}