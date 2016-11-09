package br.edu.ifpb.memoriam.facade;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import br.edu.ifpb.memoriam.dao.ContatoDAO;
import br.edu.ifpb.memoriam.dao.OperadoraDAO;
import br.edu.ifpb.memoriam.dao.PersistenceUtil;
import br.edu.ifpb.memoriam.entity.Contato;
import br.edu.ifpb.memoriam.entity.Operadora;

public class OperadoraController {
	
	private Operadora operadora;
	private List<String> mensagensErro;
	
	public List<Operadora> consultar(){
		OperadoraDAO dao = new OperadoraDAO(PersistenceUtil.getCurrentEntityManager());
		List<Operadora> operadoras= dao.findAll();
		return operadoras;
	}
	
	public Resultado cadastrar(Map<String, String[]> parametros){
		Resultado resultado= new Resultado();
		
		if(isParametrosValidos(parametros)){
			OperadoraDAO dao = new OperadoraDAO(PersistenceUtil.getCurrentEntityManager());
			dao.beginTransaction();
			
			if(this.operadora.getId() == null) {
				dao.insert(this.operadora);
			} else{
				dao.update(this.operadora);
			}
			
			dao.commit();
			resultado.setErro(false);
			resultado.setMensagensErro(Collections.singletonList("Operadora criada com sucesso"));
		}else{
			resultado.setEntitade(this.operadora);
			resultado.setErro(true);
			resultado.setMensagensErro(this.mensagensErro);
			
		}
		return resultado;
	}
	
	public Resultado excluir(Map<String, String[]> parametros){
		Resultado resultado= new Resultado();
		String[] idoperadoras = parametros.get("operadoras[]");
		
		if(idoperadoras != null && idoperadoras.length > 0 && !idoperadoras[0].isEmpty()) {
			OperadoraDAO daooperadora = new OperadoraDAO(PersistenceUtil.getCurrentEntityManager());
			ContatoDAO daocontato = new ContatoDAO(PersistenceUtil.getCurrentEntityManager());
			
			resultado.setErro(false);
			for (String id : idoperadoras) {
				daooperadora.beginTransaction();
				Operadora op = daooperadora.find(Integer.parseInt(id));
				daooperadora.commit();
				if(op!=null){
					daocontato.beginTransaction();
					List<Contato> contatos = daocontato.findAll();
					for(Contato c:contatos){
						if(c.getOperadora() == op){
							c.setOperadora(null);
							daocontato.update(c);
						}
					}
					daocontato.commit();
					
					daooperadora.beginTransaction();
					daooperadora.delete(op);
					daooperadora.commit();
				}else{
					resultado.setErro(true);
					resultado.setMensagensErro(Collections.singletonList("Operadora(s)  não encontrado(s)!"));
				}
			}
		}
		return resultado;
	}
	
	public Resultado buscar(Map<String, String[]> parametros){
		Resultado resultado= new Resultado();
		isParametrosValidos(parametros);
		
		if(this.operadora.getId() != null) {
			
			OperadoraDAO dao = new OperadoraDAO(PersistenceUtil.getCurrentEntityManager());
			if(this.operadora.getId() != null) {
				dao.beginTransaction();
				Operadora op = dao.find(this.operadora.getId());
				if(op!= null){
					this.operadora = op;
				}
				dao.commit();
				resultado.setErro(false);
				resultado.setEntitade(this.operadora);
			}else{
				resultado.setErro(true);
				resultado.setMensagensErro(Collections.singletonList("Contato não encontrado!"));
			}			
				
		}else{
		
			resultado.setErro(true);
			resultado.setMensagensErro(this.mensagensErro);
		}
		return resultado;
	}
	public boolean isParametrosValidos(Map<String, String[]> parametros){
		// nomes dos parâmetros vêm dos atributos 'name' das tags HTML do formulário
		String[] id = parametros.get("id");
		String[] nome = parametros.get("nome");
		
		this.operadora = new Operadora();
		this.mensagensErro= new ArrayList<String>();
		
		if(id != null && id.length > 0 && !id[0].isEmpty()) {
			this.operadora.setId(Integer.parseInt(id[0]));
		}
		
		if(nome == null|| nome.length == 0 || nome[0].isEmpty()) {
			this.mensagensErro.add("Nome é campo obrigatório!");
		} else{
			this.operadora.setNome(nome[0]);
		}
		
		return this.mensagensErro.isEmpty();
	}
}
