<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="pt-br">
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Carrinho</title>
	<link href="${pageContext.request.contextPath}/assets/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
	<nav class="navbar navbar-inverse">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="#">BookPlus</a>
		    </div>
		    <div class="collapse navbar-collapse" id="myNavbar">
		      <ul class="nav navbar-nav">
		        <li class="active"><a href="#">Catálogo</a></li>
		         <c:if test="${fn:length(carrinho.itemsCarrinho) > 0}">
			      	<li><a href="${pageContext.request.contextPath}/resumo?op=resumir">Resumo</a></li>
			        <li><a href="${pageContext.request.contextPath}/finaliza?op=finalizar">Finalizar</a></li>
		      	</c:if>
		      </ul>
		      <ul class="nav navbar-nav navbar-right">
		      <c:if test="${fn:length(carrinho.itemsCarrinho) > 0}">
		      	<li><a href="${pageContext.request.contextPath}/resumo?op=resumir"><span class="glyphicon glyphicon-shopping-cart"></span> <span class="badge">${fn:length(carrinho.itemsCarrinho)}</span></a></li>
		      </c:if>	
		       <!--   <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>-->
		      </ul>
		    </div>
		  </div>
	</nav>
	<div class="container">
		<div class="jumbotron text-center">
			<h1>Catálogo de Produtos</h1>
			<table class="table table-hover">
				<tr>
					<th></th><th>Nome</th><th>Descrição</th><th>Preço</th>		
				</tr>
				<c:forEach var="item" items="${catalogo}">
					<tr align="left">
						<td>
							<a href="${pageContext.request.contextPath}/pedido?op=adicionar&id=${item.itemID}" class="btn btn-success" role="button"><span class="glyphicon glyphicon-plus-sign"></span> Adicionar</a>
						</td>
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
