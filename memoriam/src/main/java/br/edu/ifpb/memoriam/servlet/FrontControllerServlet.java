package br.edu.ifpb.memoriam.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import antlr.collections.List;
import br.edu.ifpb.memoriam.entity.Contato;
import br.edu.ifpb.memoriam.entity.Operadora;
import br.edu.ifpb.memoriam.entity.Usuario;
import br.edu.ifpb.memoriam.facade.ContatoController;
import br.edu.ifpb.memoriam.facade.LoginController;
import br.edu.ifpb.memoriam.facade.OperadoraController;
import br.edu.ifpb.memoriam.facade.Resultado;

@WebServlet("/controller.do")
public class FrontControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ContatoController contatoCtrl = new ContatoController();
		OperadoraController operadoraCtrl = new OperadoraController();

		Resultado resultado= null;
		String proxPagina= null;
		String paginaErro= "controller.do?op=bcsctt";
		String paginaBuscar= "controller.do?op=edtctt";
		
		this.getServletContext().removeAttribute("msgs");
		
		String operacao = request.getParameter("op");
		
		if(operacao == null){
			this.getServletContext().setAttribute("msgs", "Operação (op) não especificadana requisição!");
			response.sendRedirect(request.getHeader("Referer"));
			return;
		}
		
		switch(operacao) {
		
			case "conctt":
				java.util.List<Contato> contatos = contatoCtrl.consultar();
				request.setAttribute("contatos", contatos);
				proxPagina= "contato/consulta.jsp";
			break;
			case "edtctt":
				resultado= contatoCtrl.buscar(request.getParameterMap());
				if(!resultado.isErro()) {
					proxPagina = "contato/cadastro.jsp";
					request.setAttribute("contato", (Contato) resultado.getEntidade());
					request.setAttribute("msgs", resultado.getMensagens());
				} else{
					request.setAttribute("msgs", resultado.getMensagens());
					proxPagina= paginaErro;
				}
			break;
			case "conoper":
				java.util.List<Operadora> operadoras = operadoraCtrl.consultar();
				request.setAttribute("operadoras", operadoras);
				proxPagina= "operadora/consulta.jsp";
			break;
			case "edtopera":
				resultado= operadoraCtrl.buscar(request.getParameterMap());
				if(!resultado.isErro()) {
					proxPagina = "operadora/cadastro.jsp";
					request.setAttribute("msgs", resultado.getMensagens());
					request.setAttribute("operadora", (Operadora) resultado.getEntidade());
				} else{
					request.setAttribute("msgs", resultado.getMensagens());
					//paginaErro = proxPagina;
					paginaErro = "login/login.jsp";
				}
			break;
			default:
				proxPagina= "../index.jsp";
			
		}
		
		RequestDispatcher dispatcher= request.getRequestDispatcher(proxPagina);
		dispatcher.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.getServletContext().removeAttribute("msgs");
		String operacao= request.getParameter("op");
		if(operacao== null) {
			this.getServletContext().setAttribute("msgs", new String[]{"Operação (op) não especificada na requisição!"});
			response.sendRedirect(request.getHeader("Referer"));
			return;
		}
		ContatoController contatoCtrl= new ContatoController();
		OperadoraController operadoraCtrl = new OperadoraController();
		
		Resultado resultado= null;
		String paginaSucesso= "controller.do?op=conctt";
		String paginaErro= "contato/cadastro.jsp";
		String proxPagina= null;
		
		switch(operacao) {
			case"login":
				LoginController loginCtrl= new LoginController();
				paginaSucesso= "controller.do?op=conctt";
				resultado= loginCtrl.isValido(request.getParameterMap());
				if(resultado.isErro()) {
					request.setAttribute("msgs", resultado.getMensagens());
					proxPagina= "../index.jsp";
				}else{
					//session.setAttribute("usuario", (Usuario) resultado.getEntidade());
					proxPagina= paginaSucesso;
				}break;
			case "cadctt":
				resultado= contatoCtrl.cadastrar(request.getParameterMap());
				if(!resultado.isErro()) {
					proxPagina = paginaSucesso;
					request.setAttribute("msgs", resultado.getMensagens());
				} else{
					request.setAttribute("contato", (Contato) resultado.getEntidade());
					request.setAttribute("msgs", resultado.getMensagens());
					proxPagina= paginaErro;
				}
			break;
			case "excctt":
				resultado= contatoCtrl.excluir(request.getParameterMap());
				if(!resultado.isErro()) {
					proxPagina = paginaSucesso;
					request.setAttribute("msgs", resultado.getMensagens());
				} else{
					request.setAttribute("contato", (Contato) resultado.getEntidade());
					request.setAttribute("msgs", resultado.getMensagens());
					proxPagina= paginaErro;
				}
			break;
			case "cadopera":
				resultado= operadoraCtrl.cadastrar(request.getParameterMap());
				if(!resultado.isErro()) {
					proxPagina = "controller.do?op=conoper";
					request.setAttribute("msgs", resultado.getMensagens());
				} else{
					request.setAttribute("operadora", (Operadora) resultado.getEntidade());
					request.setAttribute("msgs", resultado.getMensagens());
					proxPagina= "operadora/cadastro.jsp";
				}
			break;
			case "excopera":
				resultado= operadoraCtrl.excluir(request.getParameterMap());
				if(!resultado.isErro()) {
					proxPagina = "controller.do?op=conoper";
					request.setAttribute("msgs", resultado.getMensagens());
				} else{
					request.setAttribute("operadora", (Operadora) resultado.getEntidade());
					request.setAttribute("msgs", resultado.getMensagens());
					proxPagina= "controller.do?op=conoper";
				}
			break;
			default:
				request.setAttribute("erro", "Operação não especificada no servlet!");
				proxPagina= "../erro/erro.jsp";
		}
		
		if(resultado.isErro()){
				RequestDispatcher dispatcher= request.getRequestDispatcher(proxPagina);
				dispatcher.forward(request, response);
		}else{
			response.sendRedirect(proxPagina);
		}
	}

}
