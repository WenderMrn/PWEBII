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
import br.edu.ifpb.memoriam.facade.ContatoController;

@WebServlet("/controller.do")
public class FrontControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ContatoController contatoCtrl = new ContatoController();
		
		String proxPagina= null;
		
		this.getServletContext().removeAttribute("msgs");
		
		String operacao = request.getParameter("op");
		
		if(operacao == null){
			this.getServletContext().setAttribute("msgs", "Operação (op) não especificadana requisição!");
			response.sendRedirect(request.getHeader("Referer"));return;
		}
		
		switch(operacao) {
		
			case "conctt":
				java.util.List<Contato> contatos = contatoCtrl.consultar();
				request.setAttribute("contatos", contatos);
				proxPagina= "contato/consulta.jsp";
			break;
			
		}
		
		RequestDispatcher dispatcher= request.getRequestDispatcher(proxPagina);
		dispatcher.forward(request, response);
	}

}
