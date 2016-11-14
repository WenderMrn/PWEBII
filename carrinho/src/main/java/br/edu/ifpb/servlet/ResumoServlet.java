package br.edu.ifpb.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.ifpb.pweb.carrinho.model.Carrinho;
import br.edu.ifpb.pweb.carrinho.model.Item;
import br.edu.ifpb.pweb.carrinho.model.ItemCarrinho;

@WebServlet("/resumo")
public class ResumoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String operacao= request.getParameter("op");
		
		if(operacao.equals("resumir")){
			HttpSession session = request.getSession();
			if(session.getAttribute("carrinho") != null){
				Carrinho carrinho = (Carrinho)session.getAttribute("carrinho");
				session.setAttribute("carrinho",carrinho);
			}
		}
		RequestDispatcher dispatcher= request.getRequestDispatcher("resumo/resumo.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String operacao= request.getParameter("op");
		
		if(operacao.equals("finalizar")){
			Map<String, String[]> parametros = request.getParameterMap();
			System.out.println("a");
		}
	}

}
