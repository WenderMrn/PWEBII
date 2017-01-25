<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tt" tagdir="/WEB-INF/tags/templating"%>    
<%@taglib prefix="mm" tagdir="/WEB-INF/tags/messages"%>
<tt:template title="Memoriam">
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
				<a href="${pageContext.request.contextPath}/operadora/cadastro.jsp" class="form-control btn btn-primary">Nova</a>
				<a href="${pageContext.request.contextPath}/controller.do?op=conctt" class="form-control btn btn-default">Voltar</a>
				</form>
			</div>
		</div>	
	</jsp:body>
</tt:template>