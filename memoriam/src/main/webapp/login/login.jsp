<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="mm" tagdir="/WEB-INF/tags/messages"%>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type"content="text/html; charset=UTF-8">
<title>Memoriam</title>
<link href="${pageContext.request.contextPath}/assets/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/assets/css/memoriam.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/login.css" rel="stylesheet">
</head>
</head>
<body>
	<div class="container">
		<form class="form-signin" action="${pageContext.request.contextPath}/controller.do?op=login" method="POST"> 
			<h2 class="form-signin-heading">Memoriam<i class="glyphicon glyphicon-phone"></i></h2>
			<div class="form-group">
				<label for="inputEmail" class="sr-only">Usuário</label>
				<input type="email" name="login" id="login" class="form-control" placeholder="Email" requiredautofocus>
			</div>
			<div class="form-group">	
				<label for="inputPassword"class="sr-only">Senha</label>
				<input type="password" id="senha" name="senha" class="form-control" placeholder="Senha" required>
			</div>	
			<button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>
			<mm:messages value="${msgs}" erroStyle="color:red" infoStyle="color:blue"/>
		</form>
	</div><!--/container -->
</body>
</html>