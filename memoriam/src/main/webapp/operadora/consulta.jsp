<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type"content="text/html; charset=UTF-8">
<title>Memoriam</title>
<link href="${pageContext.request.contextPath}/assets/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/assets/css/memoriam.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div id="navbar">
				<c:if test="${perfil eq 'ADMIN'}">
					<ul class="nav navbar-nav">
						<li><a href="${pageContext.request.contextPath}/controller.do?op=conctt">Contatos</a></li>
						<li><a href="${pageContext.request.contextPath}/controller.do?op=conoper">Operadoras</a></li>
					</ul>
				</c:if>
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
	<div class="container">
		<div class="jumbotron">
			<h2><a href="${pageContext.request.contextPath}/controller.do?op=conctt"><i class="glyphicon glyphicon-phone"></i>Memoriam</a></h2>
			<form action="${pageContext.request.contextPath}/controller.do" method="POST">
				<input type="hidden"name="op" value="excopera">
				<table>
					<tr align="left">
						<th></th>
						<th>Operadora</th>
					</tr>
					<c:forEach var="operadora" items="${operadoras}">
						<tr align="left">
							<td><input type="checkbox" value="${operadora.id}" name="operadoras[]" class="operadoras-check"/></td><td><a href="controller.do?op=edtopera&id=${operadora.id}" style="margin-left: 10px;">${operadora.nome}</a></td>
						</tr>
					</c:forEach>
				</table>
			<button type="submit" class="form-control btn btn-danger" id="btn-excluir">Excluir</button>
			<a href="${pageContext.request.contextPath}/operadora/cadastro.jsp"class="form-control btn btn-primary">Nova</a>
			</form>
		</div>
	</div>	
</body>
<script src="${pageContext.request.contextPath}/assets/lib/jquery/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/lib/bootstrap/js/bootstrap.min.js"></script>
<script> 
$("#btn-excluir").hide();
$(".operadoras-check").on( "click",function(){
	var n = $( ".operadoras-check:checked" ).length;
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