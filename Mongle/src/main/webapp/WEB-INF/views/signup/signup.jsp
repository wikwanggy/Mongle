<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/signup/signup.css">
<title>Insert title here</title>
</head>
<body>  
	<div> <!--  -->
		<div id="signup">
			<header>
				<img alt="로그인 마크" src="../resources/css/signup/signupimg/logo.png">
				<h1>Sign Up</h1>
			</header>
			<form action="/Mongle/signin/signin" method="post">
				<div>
					<input type="text" name="name" placeholder="N A M E">
				</div>
				<div>
					<input type="text" name="nickname" placeholder="N I C K N A M E">
				</div>
				<div>
					<input type="text" name="id" placeholder="ID">
				</div>
				<div>
					<input type="password" name="password" placeholder="PASSWORD">
				</div>
				<div>
					<input type="password" placeholder="Password확인" >
				</div>
				<div>
					<input type="text" name="btd" placeholder="DATE OF BRITH">
				</div>
				<div>
					<input type="email" name="email" placeholder="Email@gmail.com">
				</div>
				<div>
					<input type="tel" name="phone" placeholder="010-0000-0000">
				</div>
				<div>
					<input type="text" name="addr" placeholder="ex)울산 남구">
				</div>
				<div>
					<input type="submit" value="Sign Up" id="btn">
				</div>
			</form>
		</div>
	</div>
</body>
</html>