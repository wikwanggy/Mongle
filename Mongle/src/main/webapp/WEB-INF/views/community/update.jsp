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
<link rel="stylesheet" href="../resources/css/boardlist.css">
<jsp:include page="../header.jsp"/>
</head>
<body>
<%
	int bno = Integer.parseInt(request.getParameter("bno"));
	Connection conn = null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
		conn = ds.getConnection();

		pstmt=conn.prepareStatement("select bno, title, name, content from Mongle_board b"
				+" join Mongle_member m"
				+" on m.id=b.id"
				+" where bno=?");
		pstmt.setInt(1, bno);
		
		rs=pstmt.executeQuery();
			if(rs.next()){
%>
<div class="board_l">
<form>
	<table border="1" class="board_write">
		<tr>
			<td><input type="text" placeholder="제목" class="board_write_title" value="<%=rs.getString("title") %>"></td>
		</tr>
		<tr>
			<td><textarea cols="115" rows="30" placeholder="내용"><%=rs.getString("content") %></textarea></td>
		</tr>
		<tr>
			<td><input type="submit" value="저장" class="btn_board"></td>
		</tr>
	</table>
</form>
</div>
<%			
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		conn.close();
		rs.close();
		pstmt.close();
	}
%>
<script src="../resources/js/community.js"></script>
</body>
<jsp:include page="../footer.jsp"/>
</html>