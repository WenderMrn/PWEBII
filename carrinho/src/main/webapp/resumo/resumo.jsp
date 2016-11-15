<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BookPlus</title>
<link href="${pageContext.request.contextPath}/assets/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h1 class="text-center">Resumo da compra</h1>	
			<form action="${pageContext.request.contextPath}/finaliza?op=finalizar" method="POST">
			<ul class="list-group">
			<c:set var="totalGeral" scope="request" value="${0}"/>	
			<c:forEach var="itemc" items="${carrinho.itemsCarrinho}">
				<c:set var="totalGeral" scope="request" value="${totalGeral + itemc.precoTotal}"/>		
				  <li class="list-group-item">
				  <span><a href="#" style="color:#cc0000" class="glyphicon glyphicon-remove-sign"></a></span>
				    <span class="badge" style="background-color:#40bf80;color:#FFF">R$ ${itemc.precoTotal}</span>
				    <span><b>Título:</b> ${itemc.item.descricaoCurta}</span>
				    <div><b>qtde:</b> ${itemc.numItens} / <b>vl unit:</b> R$ ${itemc.precoUnitario}</div>
				  </li>
			  </c:forEach>
			  <li class="list-group-item" style="background-color: #c3c3c3;color: white;"><span class="badge">R$ ${totalGeral}</span>
			    <span><b>Preço líquido</b></span>
			  </li>
			  <li class="list-group-item" style="background-color: #c3c3c3;color: white;"><span class="badge" id="impostos">R$ <fmt:formatNumber value="${totalGeral * 0.02}" type="currency"/></span>
			    <span><b>Impostos</b></span>
			  </li>
			   <li class="list-group-item" style="background-color: #c3c3c3;color: white;"><span class="badge" id="totalgeral">R$ <fmt:formatNumber value="${totalGeral + totalGeral * 0.02}" type="currency"/></span>
			    <span><b>Valor Total</b></span>
			  </li>
			</ul>
			<div class="row">
				<div class="col-md-4">
					<h4>Forma de envio</h4>
					<select id="forma-envio" name="forma-envio" class="form-control">
						<option value="eco">Econômica</option>
						<option value="exp">Rápida</option>
					</select>
				</div>
			</div>
			<br>
			<div class="row">	
			  <div class="col-sm-12">
			    <div class="row">
			      <div class="col-xs-9 col-sm-9">
			        <div class="row">
						<div class="col-md-6">	
							 <div class="form-group">
							    <label for="nome">Nome completo</label>
							    <input type=text class="form-control" id="nome" name="nome" placeholder="Nome completo">
							  </div>
					  	</div>
					  	<div class="col-md-3">	
							 <div class="form-group">
							    <label for="numcart">Núm. cartão</label>
							    <input type="text" class="form-control" id="numcart" name="numcart" placeholder="Núm. do cartão">
							  </div>
					  	</div>
					</div>
					<div class="row">
						<div class="col-md-6">	
						 	<div class="form-group">
							    <label for="logradouro">Logradouro</label>
							    <input type="text" class="form-control" id="logradouro" name="logradouro" placeholder="Logradouro">
						  	</div>
					  	</div>
					  	<div class="col-md-3">	
						 	<div class="form-group">
							    <label for="numero">Número</label>
							    <input type="text" class="form-control" id="numero" name="lognum" placeholder="Número">
						  	</div>
					  	</div>
					</div>
					<div class="row">
						<div class="col-md-4">	
						 	<div class="form-group">
							    <label for="bairro">Bairro</label>
							    <input type="text" class="form-control" id="bairro" name="bairro" placeholder="Bairro">
						  	</div>
					  	</div>
					  	<div class="col-md-3">	
						 	<div class="form-group">
							    <label for="cidade">Cidade</label>
							    <input type="text" class="form-control" id="cidade" name="cidade" placeholder="Cidade">
						  	</div>
					  	</div>
					  	<div class="col-md-2">	
						 	<div class="form-group">
							    <label for="Estado">Estado</label>
							    <input type="text" class="form-control" id="estado" name="estado" placeholder="Estado">
						  	</div>
					  	</div>
					</div>	
			      </div>
			    </div>
			  </div>
			</div>
			<input type="hidden" name="impostos" value="" id="p_impostos"/>
			<input type="hidden" name="totalgeral" value="" id="p_totalgeral"/>
			<button type="submit" class="btn btn-success">Efetivar compra</button>
			</form>
		</div>
	</div>	
	<script src="${pageContext.request.contextPath}/assets/lib/jquery/jquery-3.1.1.min.js"></script>
	<script>
		
		$( "#forma-envio" ).change(function() {
			var adicional = 0;
			var forma = $(this).val();
			var total = "<c:out value='${totalGeral}'/>";
			
			if(forma == "eco"){
				adicional = Number(total) * 0.02;
				total = Number(total) + adicional;
			}else{
				adicional = 25 + (Number(total) * 0.02);
				total = Number(total)+adicional;
			}
	
			$("#impostos").html("R$ "+adicional.toFixed(2));
			$("#totalgeral").html("R$ "+Number(total).toFixed(2));
			
			$("#p_impostos").val($("#impostos").html());
			$("#p_totalgeral").val($("#totalgeral").html());
			
		});
	</script>
</body>
</html>