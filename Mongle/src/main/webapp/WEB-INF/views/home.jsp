<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
<meta charset="UTF-8">
</head>
<body>
<h1>
	Hello world! 즐거운 오늘이야 !  
</h1>
	
<P>  The time on the server is ${serverTime}. </P>
<button><a href="http://localhost:8080/board/write">버튼</a></button>
</body>
</html>
