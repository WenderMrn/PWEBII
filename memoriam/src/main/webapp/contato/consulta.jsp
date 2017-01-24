<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="mm" tagdir="/WEB-INF/tags/messages"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Memoriam</title>
<link href="${pageContext.request.contextPath}/assets/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/assets/css/memoriam.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div id="navbar">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${sessionScope.usuario.nome}<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#" id="link-submit">Sair</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">${sessionScope.usuario.perfil}</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<form id="logout-form" action="controller.do" method="POST"><input type="hidden" name="op" value="logout"/></form>
	<div class="container">
		<div class="jumbotron">
			<h2><i class="glyphicon glyphicon-phone"></i>Memoriam</h2>
			<mm:messages value="${msgs}" erroStyle="color:red" infoStyle="color:blue"/>
			<form action="${pageContext.request.contextPath}/controller.do" method="POST">
				<input type="hidden"name="op" value="excctt">
				<table>
					<tr align="left">
						<th></th>
						<th style="width: 30%">Nome</th>
						<th>Telefone</th>
						<th><a href="${pageContext.request.contextPath}/controller.do?op=conoper">Operadora</a></th>
					</tr>
					<c:forEach var="contato" items="${contatos}">
						<tr align="left">
							<td><input type="checkbox" value="${contato.id}" name="contatos[]" class="contatos-check"/></td><td><a href="controller.do?op=edtctt&id=${contato.id}">${contato.nome}</a></td>
							<td>${contato.fone}</td>
							<td>${contato.operadora.nome}</td>
						</tr>
					</c:forEach>
				</table>
			<button type="submit" class="form-control btn btn-danger" id="btn-excluir">Excluir</button>
			<a href="contato/cadastro.jsp" class="form-control btn btn-primary">Novo</a>
			</form>
		</div>
	</div>	
</body>
<script src="${pageContext.request.contextPath}/assets/lib/jquery/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/lib/bootstrap/js/bootstrap.min.js"></script>
<script> 
$("#btn-excluir").hide();
$(".contatos-check").on( "click",function(){
	var n = $( ".contatos-check:checked" ).length;
	if(n > 0){
		$("#btn-excluir").show();	
	}else{
		$("#btn-excluir").hide();
	}
});
var form = document.getElementById("logout-form");
document.getElementById("link-submit").addEventListener("click", function() {
	form.submit();
});
</script>
</html>	