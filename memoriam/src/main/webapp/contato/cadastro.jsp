<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="mm" tagdir="/WEB-INF/tags/messages"%>
<%@taglib prefix="tt" tagdir="/WEB-INF/tags/templating"%>     

<tt:template title="Cadastro de Contato">
	<jsp:attribute name="tscript">
	</jsp:attribute>
	<jsp:body>	
		<div class="container">
			<div class="jumbotron">
				<h2><i class="glyphicon glyphicon-phone"></i>Memoriam</h2>
				<h3>Dados do Contato</h3>
				<mm:messages value="${msgs}" erroStyle="color:red" infoStyle="color:blue"/>
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
						<a href="${pageContext.request.contextPath}/controller.do?op=conctt" class="form-control btn btn-default">Voltar</a>
				</form>
			</div>
		</div>
		<c:set var="endofconversation" value="true" scope="request"/>
	</jsp:body>
</tt:template>