<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Memoriam</title>
<link href="${pageContext.request.contextPath}/assets/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/assets/css/memoriam.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h2><i class="glyphicon glyphicon-phone"></i>Memoriam</h2>
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
</html>
<script src="${pageContext.request.contextPath}/assets/lib/jquery/jquery-3.1.1.min.js"></script>
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
</script>	