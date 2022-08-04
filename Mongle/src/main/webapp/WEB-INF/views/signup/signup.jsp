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
	<div>
		<div id="signup">
			<header>
				<img alt="로그인 마크" src="../resources/css/signup/signupimg/1.PNG">
				<h1>회원가입</h1>
			</header>
				<div id="signup">
				<table>
					<tr id="name">
						<td>이름 :</td>
						<td><input tpye="text"></td>
					</tr>
					<tr id="Nickname">
						<td>닉네임 :</td>
						<td><input tpye="text"></td>
					</tr>
					<tr id="id">
						<td>아이디 :</td>
						<td><input tpye="text"></td>
					</tr>
					<tr id="pw">
						<td>비밀번호 :</td>
						<td><input tpye="password"></td>
					</tr>
					<tr id="pw2">
						<td>비밀번호 확인 :</td>
						<td><input tpye="password"></td>
					</tr>
					<tr id="ssan">
						<td>주민 번호 :</td>
						<td><input tpye="">-<input tpye=""></td>
					</tr>
					<tr id="email">
						<td>이메일 :</td>
						<td><input tpye="">@<input tpye=""></td>
					</tr>
					<tr id="tel">
						<td>전화 번호 :</td>
						<td><input tpye="text">-<input tpye="text">-<input tpye="text"></td>
					</tr>
					<tr id="addr">
						<td rowspan="2">주 소 :</td>
						<td rowspan="2"><input tpye=""></td>
					</tr>
					<tr id="addr">
						<td></td>
						<td></td>
					</tr>
					<tr id="gender">
						<td>성 별 :</td>
						<td>남<input tpye="radio" name="man" checked>여<input tpye="radio" name="girl"></td>
					</tr>
				</table>
				</div>
		</div>
	</div>
</body>
</html>