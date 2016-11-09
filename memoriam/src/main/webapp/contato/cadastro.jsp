<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Cadastro de Contato</title>
	<link href="${pageContext.request.contextPath}/assets/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/assets/css/memoriam.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h2><i class="glyphicon glyphicon-phone"></i>Memoriam</h2>
			<h3>Dados do Contato</h3>
			<c:if test="${not empty msgs}">
				<div align="left">
					<div style="color: red">
						<ul style="padding-left:0px;">
							<c:forEach var="msg" items="${msgs}">
								<li style="list-style-type: none;">${msg}</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</c:if>
			<form action="${pageContext.request.contextPath}/controller.do" method="POST" class="form-horizontal">
				<input type="hidden"name="op" value="cadctt">
				<input type="hidden"name="id" value="${requestScope.contato.id}">
				<input id="nome" value="${requestScope.contato.nome}" name="nome"type="text" class="form-control" placeholder="Nome"/>
				<input id="fone" value="${requestScope.contato.fone}"name="fone"class="form-control" type="text" placeholder="Fone"/>
				<fmt:formatDate var="dataAniv" value="${requestScope.contato.dataAniversario}" pattern="dd/mm/yyyy"/>
				<input id="dataaniv" value="${dataAniv}" name="dataaniv" class="form-control" type="date" placeholder="Data de criação (dd/mm/aaaa)"/>
				<select class="form-control" id="operadora" name="operadora">
					<option value="${null}" label="Selecione a operadora">Selecione a operadora</option>
					<c:forEach var="operadora" items="${utilBean.operadoras}">
						<c:if test="${operadora.id eq contato.operadora.id}">
							<option value="${operadora.id}" label="${operadora.nome}" selected>${operadora.nome}</option>
						</c:if>
						<c:if test="${operadora.id ne contato.operadora.id}">
						<option value="${operadora.id}" label="${operadora.nome}">${operadora.nome}</option>
						</c:if>
					</c:forEach>
				</select>
				<input type="submit" class="form-control btn btn-primary" value="Salvar">
			</form>
		</div>
	</div>
	<c:set var="endofconversation" value="true" scope="request"/>
	<script src="${pageContext.request.contextPath}/assets/lib/jquery/jquery-3.1.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/lib/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>