<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인/로그아웃</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
//	login 버튼이 클릭되면 넘어오는 데이터(id, pw)를 받는다.
	String id = "";
	String password = "";
	try{
		 id = request.getParameter("id").trim();
		 password = request.getParameter("password").trim();
	} catch (NullPointerException e){}
	
//	id가 hong이고 password가 123456이면 로그인 처리한다.
	out.println("<script>");
	if ((id + password).length() != 0){
		if(id.equals("hong") && password.equals("123456")){
//			로그인 처리
//			로그인 되었으므로 로그인 정보를 session에 저장한다		
			session.setAttribute("id", id);
			session.setAttribute("name", "관리자");
			session.setAttribute("login", "yes");
			out.println("alert('" + session.getAttribute("name") + "님 어서오세요')");

		} else {
//			로그인 에러 메시지
			out.println("alert('아이디 또는 비밀번호가 올바르지 않습니다.')");
		}
	} 
	out.println("</script>");
	
//	로그아웃 버튼이 클릭되면 넘어오는 데이터를 받는다.
	String logout = request.getParameter("logout");

//	로그아웃 정보가 넘어왔으면 로그아웃 처리를 한다.
	if(logout != null && logout.equals("yes")){
		out.println("<script>");
		out.println("alert('" + session.getAttribute("name") + "님 안녕히가세요')");
		out.println("</script>");
//	로그아웃 되었으므로 session에서 로그인 정보를 제거한다.
		session.removeAttribute("id");
		session.removeAttribute("name");
		session.removeAttribute("login");

	}
	
//	session에서 로그인 정보를 읽어와서 로그인 상태, 로그아웃 상태의 화면을 브라우저에 표시한다.
	String login = (String)session.getAttribute("login");
	if(login!= null && login.equals("yes")){	// 로그인 상태인가
%>
<!-- 로그인 상태일 경우 브라우저에 표시될 내용 -->
<h2>로그인 성공</h2><br>
<%= session.getAttribute("name")%>님 안녕하세요<br>
${name}님 안녕하세요<br>
<input type="button" value="로그아웃" onclick="location.href='?logout=yes'">

<% 
	} else{ 	// 로그아웃 상태인가
%>
<!-- 로그아웃 상태일 경우 브라우저에 표시될 내용 -->
<form action="?" method="post">
	<table width="300" border="1" cellpadding="5" cellspacing="0">
<!-- 	
		<tr>
			<td colspan="2" align="center">
				<label>id: <input type="text" name="id"></label>
			</td>
		</tr> 
-->
		<tr>
			<th width="50">
				<label for="id">id</label>
			</th>
			<td width="250">
				<input id="id" type="text" name="id">
			</td>
		</tr>
		<tr>
			<th width="50">
				<label for="pw">pw</label>
			</th>
			<td width="250">
				<input id="pw" type="password" name="password">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="로그인">
			</td>
		</tr>
	</table>
</form>

<% 		
	}
%>





</body>
</html>