<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/boardlist.css">
<title>Insert title here</title>
</head>
<jsp:include page="../header.jsp"/>
<body>
<div class="board_l">
<%
	int bno = Integer.parseInt(request.getParameter("bno"));
	Connection conn = null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;

	try{
	Context init = new InitialContext();
	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
	conn = ds.getConnection();

	pstmt=conn.prepareStatement("select bno, title, name, content from board b"
			+" join member m"
			+" on m.id=b.id"
			+" where bno=?");
	pstmt.setInt(1, bno);
	
	rs=pstmt.executeQuery();
		if(rs.next()){
%>	<!-- / -->
<form>
	<table border="1" id="board_detail">
		<tr>
			<td colspan="2" style="height:25px;">
				<input type="hidden" name="bno" value="<%=rs.getString("bno") %>">
				<%=rs.getString("title") %>
			</td>
		</tr>
		<tr>
			<td colspan="2"><%=rs.getString("content") %></td>
		</tr>
		<tr>
			<td id="btn_board_detail">
			<input type="submit" value="삭제" class="btn_board" formaction="delete.jsp">
			<input type="submit" value="수정" class="btn_board" formaction="update.jsp">
			</td>
		</tr>
	</table>
</form>
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
</div>
<script src="../resources/js/community.js"></script>
</body>
<jsp:include page="../footer.jsp"/>
</html>