<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="pt">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Lista de Catálogos</title>
	<link href="${pageContext.request.contextPath}/assets/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
	<div class="jumbotron">
	  <div class="container text-center">
	    <h1>Catálogo de Produtos</h1>
	    <table class="table table-condensed">
			<tr>
				<th>Nome</th><th>Descrição</th><th>Preço</th>
			</tr>
			<c:forEach var="item" items="${catalogo}">
				<tr align="left">
					<!--  <td><input type="checkbox" value="${contato.id}" name="contatos[]" class="contatos-check"/></td><td><a href="controller.do?op=edtctt&id=${contato.id}">${contato.nome}</a></td>-->
					<td>${item.descricaoCurta}</td>
					<td>${item.descricaoLonga}</td>
					<td>${item.preco}</td>
				</tr>
			</c:forEach>
		</table>
	  </div>
	</div>	
	<script src="${pageContext.request.contextPath}/assets/lib/jquery/jquery-3.1.1.min.js"></script>
</body>
</html>