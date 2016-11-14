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
import br.edu.ifpb.pweb.carrinho.model.Catalogo;
import br.edu.ifpb.pweb.carrinho.model.Item;
import br.edu.ifpb.pweb.carrinho.model.ItemCarrinho;


@WebServlet("/pedido")
public class PedidoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ItemCarrinho itemcarrinho;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String operacao= request.getParameter("op");
		if(operacao.equals("adicionar")){
			
			Map<String, String[]> parametros = request.getParameterMap();
			String[] id = parametros.get("id");
			
			if(isParametrosValidos(parametros)){
				
				HttpSession session = request.getSession();
				if(session.getAttribute("carrinho") == null){
					Carrinho carrinho = new Carrinho();
					carrinho.adicioneItem(itemcarrinho.getItemID());
					session.setAttribute("carrinho",carrinho);
				}else{
					Carrinho carrinho = (Carrinho)session.getAttribute("carrinho");
					if(session != null)
						carrinho.adicioneItem(itemcarrinho.getItemID());
				}
			}
			
			
		}
		RequestDispatcher dispatcher= request.getRequestDispatcher("catalogo?op=listar");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
	public boolean isParametrosValidos(Map<String, String[]> parametros){
		
		boolean r = true;
	
		String[] id = parametros.get("id");
		
		if(id != null && id.length > 0 && !id[0].isEmpty()) {
			for (Item item : Catalogo.getItems()) {
				
				if(item.getItemID().equals(id[0])){
					this.itemcarrinho = new ItemCarrinho(item);
					break;
				}
			}
			
		}else{
			r = false;
		}
		
		return r;
	}

}
