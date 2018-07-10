<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="java.sql.Connection" %>
<%@page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" align = "center">
	<tr>
		<th>id</th>
		<th>名字</th>
		<th>密码</th>
		<th>创建时间</th>
	</tr>
	<%
		String driverClass ="com.mysql.jdbc.Driver";
		String url ="jdbc:mysql://localhost:3306/user";
		String user = "root";
		String psw = "admin";
		Connection conn;
		try{
			Class.forName(driverClass).newInstance();
			conn = DriverManager.getConnection(url,user,psw);
			Statement stmt = conn.createStatement();
			String sql = "SELECT * FROM tbl_users";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				
	%>
	<tr>
		<td><%=rs.getString("id") %></td>
		<td><%=rs.getString("name") %></td>
		<td><%=rs.getString("password") %></td>
		<td><%=rs.getString("create_date") %></td>
	</tr>
	<%
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
</table>
</body>
</html>