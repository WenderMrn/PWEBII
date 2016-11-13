<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="pt-br">
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Carrinho</title>
	<link href="${pageContext.request.contextPath}/assets/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
	<div class="container">
		<div class="jumbotron text-center">
			<h1>Catálogo de Produtos</h1>	
			<table class="table table-hover">
				<tr>
					<th>Nome</th><th>Descrição</th><th>Preço</th>		
				</tr>
				<c:forEach var="item" items="${catalogo}">
					<tr align="left">
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
