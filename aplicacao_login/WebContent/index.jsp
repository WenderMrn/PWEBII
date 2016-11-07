<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<fomr action="${pageContext.request.contextPath}/controller?op=login">
			<div>
				Login: <input type="text" name="login"/>
			</div>	
			<div>
				Senha: <input type="password" name="senha"/>	
			</div>
			<div>
				<button type="submit">logar</button>	
			</div>
		</fomr>
</body>
</html>