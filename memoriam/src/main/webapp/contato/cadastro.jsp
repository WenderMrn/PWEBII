<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<metahttp-equiv="Content-Type"content="text/html; charset=UTF-8">
	<title>Cadastro de Contato</title>
	<link href="${pageContext.request.contextPath}/assets/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/assets/css/memoriam.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h2><i class="glyphicon glyphicon-phone"></i>Memoriam</h2>
			<h3>Dados do Contato</h3>
			<form action="${pageContext.request.contextPath}/controller.do" method="POST"class="form-horizontal">
				<input type="hidden"name="op" value="cadctt">
				<input id="nome" value="${contato.nome}" name="nome"type="text" class="form-control" placeholder="Nome"/>
				<input id="fone" value="${contato.fone}"name="fone"class="form-control" type="text" placeholder="Fone"/>
				<fmt:formatDate var="dataAniv" value="${contato.dataAniversario}" pattern="dd/MM/yyyy"/>
				<input id="dataaniv" value="${dataAniv}" name="dataaniv" class="form-control" type="date" placeholder="Data de criação (dd/mm/aaaa)"/>
				<input type="submit" class="form-control btn btn-primary" value="Salvar">
			</form>
		</div>
	</div>
	<c:set var="endofconversation" value="true" scope="request"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"/>
	<script src="${pageContext.request.contextPath}/assets/lib/bootstrap/js/bootstrap.min.js"/>
</body>
</html>