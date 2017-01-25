<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tt" tagdir="/WEB-INF/tags/templating"%>    
<%@taglib prefix="mm" tagdir="/WEB-INF/tags/messages"%>    

<tt:template title="Cadastro de Operadora">
	<jsp:attribute name="tscript">
		<script>
			var form = document.getElementById("logout-form");
			document.getElementById("link-submit").addEventListener("click", function() {
				form.submit();
			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<div class="container">
		<div class="jumbotron">
			<h2><a href="${pageContext.request.contextPath}/controller.do?op=conctt}"><i class="glyphicon glyphicon-phone"></i>Memoriam</a></h2>
			<h3>Dados do da Operadora</h3>
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
				<input type="hidden"name="op" value="cadopera">
				<input type="hidden"name="id" value="${requestScope.operadora.id}">
				<input id="nome" value="${requestScope.operadora.nome}" name="nome"type="text" class="form-control" placeholder="Nome"/>
				<input type="submit" class="form-control btn btn-primary" value="Salvar">
					<a href="${pageContext.request.contextPath}/controller.do?op=conctt" class="form-control btn btn-default">Voltar</a>
			</form>
		</div>
	</div>
	<c:set var="endofconversation" value="true" scope="request"/>
	</jsp:body>
</tt:template>	