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
			<ul class="list-group">
			<c:forEach var="itemc" items="${carrinho.itemsCarrinho}">
			  <li class="list-group-item">
			  <span><a href="#" style="color:#cc0000" class="glyphicon glyphicon-remove-sign"></a></span>
			    <span class="badge" style="background-color:#40bf80;color:#FFF">R$ ${itemc.precoTotal}</span>
			    <span><b>Título:</b> ${itemc.item.descricaoCurta}</span>
			    <div><b>qtde:</b> ${itemc.numItens} / <b>vl unit:</b> R$ ${itemc.precoUnitario}</div>
			  </li>
			  </c:forEach>
			</ul>
			<form>
			<div class="row">
				<div class="col-md-4">
					<h4>Forma de envio</h4>
					<select name="forma-envio" class="form-control">
						<option value="economica">Econômica</option>
						<option value="rapida">Rápida</option>
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
							    <input type="nome" class="form-control" id="nome" placeholder="Nome completo">
							  </div>
					  	</div>
					  	<div class="col-md-3">	
							 <div class="form-group">
							    <label for="numcart">Núm. cartão</label>
							    <input type="text" class="form-control" id="numcart" placeholder="Núm. do cartão">
							  </div>
					  	</div>
					</div>
					<div class="row">
						<div class="col-md-6">	
						 	<div class="form-group">
							    <label for="logradouro">Logradouro</label>
							    <input type="text" class="form-control" id="logradouro" placeholder="Logradouro">
						  	</div>
					  	</div>
					  	<div class="col-md-3">	
						 	<div class="form-group">
							    <label for="numero">Número</label>
							    <input type="text" class="form-control" id="numero" placeholder="Número">
						  	</div>
					  	</div>
					</div>
					<div class="row">
						<div class="col-md-4">	
						 	<div class="form-group">
							    <label for="bairro">Bairro</label>
							    <input type="text" class="form-control" id="bairro" placeholder="Bairro">
						  	</div>
					  	</div>
					  	<div class="col-md-3">	
						 	<div class="form-group">
							    <label for="cidade">Cidade</label>
							    <input type="text" class="form-control" id="cidade" placeholder="Cidade">
						  	</div>
					  	</div>
					  	<div class="col-md-2">	
						 	<div class="form-group">
							    <label for="Estado">Estado</label>
							    <input type="text" class="form-control" id="estado" placeholder="Estado">
						  	</div>
					  	</div>
					</div>	
			      </div>
			      <div class="col-xs-3 col-sm-3 text-center" style="font-size: 50px;">
			        <div class="row">
			        	<div>Total</div>	
			        </div>
			        <div class="row">
			        	<div> R$ 20.00</div>	
			        </div>	
			      </div>
			    </div>
			  </div>
			</div>	
			<button type="submit" class="btn btn-success">Confirmar</button>
			</form>
		</div>
	</div>	
	<script src="${pageContext.request.contextPath}/assets/lib/jquery/jquery-3.1.1.min.js"></script>
</body>
</html>