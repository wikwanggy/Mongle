<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 데이터 수집
	int bno = Integer.parseInt(request.getParameter("bno"));

	// db관련 처리
	Connection conn = null;
	PreparedStatement pstmt=null;

	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
		conn = ds.getConnection();
		
		pstmt=conn.prepareStatement("delete from Mongle_board where bno = ?");
		pstmt.setInt(1, bno);
		int result=pstmt.executeUpdate();
		
		if(result==1){
			out.println("<script>");
			out.println("location.href='list.jsp'");
			out.println("</script>");
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		conn.close();
		pstmt.close();
	}	
%>
</body>
</html>