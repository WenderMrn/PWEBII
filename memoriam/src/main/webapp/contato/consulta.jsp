<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tt" tagdir="/WEB-INF/tags/templating"%>    
<%@taglib prefix="mm" tagdir="/WEB-INF/tags/messages"%>
<tt:template title="Consultaa contatos">
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
				<h2><i class="glyphicon glyphicon-phone"></i>Memoriam</h2>
				<mm:messages value="${msgs}" erroStyle="color:red" infoStyle="color:blue"/>
				<form action="${pageContext.request.contextPath}/controller.do" method="POST">
					<input type="hidden" name="op" value="excctt">
					<table>
						<tr align="left">
							<th></th>
							<th style="width: 40%">Nome</th>
							<th style="width: 30%">Telefone</th>
							<th style="width: 30%">Operadora</th>
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
	</jsp:body>
</tt:template>
