package br.edu.ifpb.memoriam.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		HttpSession session= request.getSession();
		Usuario usuario= (Usuario) session.getAttribute("usuario");
		
		switch(operacao) {
		
			case "conctt":
				java.util.List<Contato> contatos = contatoCtrl.consultar(usuario);
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
		String paginaErro= "../erro/erro.jsp";
		String proxPagina= null;
		
		HttpSession session= request.getSession();
		Usuario usuario = (Usuario) session.getAttribute("usuario");
		
		switch(operacao) {
			case"login":
				LoginController loginCtrl= new LoginController();
				paginaSucesso= "controller.do?op=conctt";
				paginaErro = "login/login.jsp";
				resultado= loginCtrl.isValido(request.getParameterMap());
				if(resultado.isErro()) {
					request.setAttribute("msgs", resultado.getMensagens());
					proxPagina= paginaErro;
				}else{
					proxPagina= paginaSucesso;
					Usuario usuarioLogado = (Usuario) resultado.getEntidade();
					session.setAttribute("usuario",usuarioLogado);
					// trata o lembrar
					String lembrar= request.getParameter("lembrar");
					if(lembrar != null) {
						Cookie c= new Cookie("loginCookie", usuarioLogado.getEmail());
						c.setMaxAge(3600*60);
						response.addCookie(c);
					} else{
						for(Cookie cookie: request.getCookies()) {
							if(cookie.getName().equals("loginCookie")) {
								cookie.setValue(null);
								cookie.setMaxAge(0);
								response.addCookie(cookie);	
							}
						}
					
					}
				}
				break;
			case"logout":
				proxPagina = "login/login.jsp";
				resultado = new Resultado();
				resultado.setErro(false);
				session.invalidate();
			break;	
			case "cadctt":
				resultado= contatoCtrl.cadastrar(request.getParameterMap(),usuario);
				if(!resultado.isErro()) {
					proxPagina = paginaSucesso;
					request.setAttribute("msgs", resultado.getMensagens());
				} else{
					request.setAttribute("contato", (Contato) resultado.getEntidade());
					request.setAttribute("msgs", resultado.getMensagens());
					proxPagina= "contato/cadastro.jsp";
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
