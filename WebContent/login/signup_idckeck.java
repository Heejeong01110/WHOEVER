public static boolean ckeck(string id) {
	String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	Connection con = null;
	Statement state = null;

	try {
		Class.forName(JDBC_DRIVER);
		con = DriverManager.getConnection("jdbc:mysql://localhost/whoever", "root", "1234");
		state = con.createStatement();
		ResultSet rs;
		String sql;

		sql = " SELECT id FROM user ";
		rs = state.executeQuery(sql);

		while (rs.next()) {
			if(rs.getString("id").equals(id)){
				return true;
			}
		}

		rs.close();
		state.close();
		con.close();

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (state != null)
				state.close();
		} catch (SQLException ex1) {

		}
		try {
			if (con != null)
				con.close();
		} catch (SQLException ex1) {

		}
	}
	return false;
}