package br.edu.ifpb.memoriam.facade;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;

import br.edu.ifpb.memoriam.dao.ContatoDAO;
import br.edu.ifpb.memoriam.dao.OperadoraDAO;
import br.edu.ifpb.memoriam.dao.PersistenceUtil;
import br.edu.ifpb.memoriam.entity.Contato;
import br.edu.ifpb.memoriam.entity.Operadora;

public class ContatoController {
	
	private Contato contato;
	private List<String> mensagensErro;
	
	public List<Contato> consultar(){
		ContatoDAO dao = new ContatoDAO(PersistenceUtil.getCurrentEntityManager());
		List<Contato> contatos= dao.findAll();
		return contatos;
	}
	
	public Resultado cadastrar(Map<String, String[]> parametros){
		Resultado resultado= new Resultado();
		
		if(isParametrosValidos(parametros)){
			ContatoDAO dao = new ContatoDAO(PersistenceUtil.getCurrentEntityManager());
			dao.beginTransaction();
			
			if(this.contato.getId() == null) {
				dao.insert(this.contato);
			} else{
				dao.update(this.contato);
			}
			
			dao.commit();
			resultado.setErro(false);
			resultado.setMensagensErro(Collections.singletonList("Contato criado com sucesso"));
		}else{
			resultado.setEntitade(this.contato);
			resultado.setErro(true);
			resultado.setMensagensErro(this.mensagensErro);
			
		}
		return resultado;
	}
	
	public Resultado buscar(Map<String, String[]> parametros){
		Resultado resultado= new Resultado();
		isParametrosValidos(parametros);
		
		if(this.contato.getId() != null) {
			
			ContatoDAO dao = new ContatoDAO(PersistenceUtil.getCurrentEntityManager());
			if(this.contato.getId() != null) {
				dao.beginTransaction();
				Contato c = dao.find(this.contato.getId());
				if(c!= null){
					this.contato.setNome(c.getNome());
					this.contato.setFone(c.getFone());
					this.contato.setDataAniversario(c.getDataAniversario());
				}
				dao.commit();
				resultado.setErro(false);
				resultado.setEntitade(this.contato);
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
	
	/*public Resultado editar(Map<String, String[]> parametros){
		Resultado resultado= new Resultado();
		String[] id =  parametros.get("id");
		if(id != null && id.length > 0 && !id[0].isEmpty()) {
			ContatoDAO dao = new ContatoDAO(PersistenceUtil.getCurrentEntityManager());
			
				if(this.contato.getId() != null) {
					dao.beginTransaction();
					 Contato c = dao.find(this.contato.getId());
					if(isParametrosValidos(parametros)){
						c.setNome(this.contato.getNome());
						c.setFone(this.contato.getFone());
						c.setDataAniversario(this.contato.getDataAniversario());
						dao.update(c);
					}
					dao.commit();
					resultado.setErro(false);
					resultado.setMensagensErro(Collections.singletonList("Contato alterado com sucesso"));
				}else{
					resultado.setErro(true);
					resultado.setMensagensErro(Collections.singletonList("Contato não encontrado!"));
				}			
						
		}else{
			resultado.setEntitade(this.contato);
			resultado.setErro(true);
			resultado.setMensagensErro(this.mensagensErro);
		}
		return resultado;
	}*/
	public boolean isParametrosValidos(Map<String, String[]> parametros){
		// nomes dos parâmetros vêm dos atributos 'name' das tags HTML do formulário
		String[] id = parametros.get("id");
		String[] nome = parametros.get("nome");
		String[] fone = parametros.get("fone");
		String[] dataAniv = parametros.get("dataaniv");
		String[] idOperadora = parametros.get("operadora");
		
		this.contato = new Contato();
		this.mensagensErro= new ArrayList<String>();
		
		if(id != null && id.length > 0 && !id[0].isEmpty()) {
			contato.setId(Integer.parseInt(id[0]));
		}
		
		if(nome == null|| nome.length == 0 || nome[0].isEmpty()) {
			this.mensagensErro.add("Nome é campo obrigatório!");
		} else{
			contato.setNome(nome[0]);
		}
		
		if(fone == null|| fone.length == 0 || fone[0].isEmpty()) {
			this.mensagensErro.add("Fone é campo obrigatório!");
		} else{
			contato.setFone(fone[0]);
		}
		
		if(dataAniv == null|| dataAniv.length == 0 || dataAniv[0].isEmpty()) {
			this.mensagensErro.add("Data de aniversário é campo obrigatório!");
		} else{
			
			if(dataAniv[0].matches("(19|20)\\d{2,2}\\-(0[1-9]|1[012])\\-(0[1-9]|[12][0-9]|3[01])")) {
				try{
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					sdf.setLenient(false);
					Date dataIni = sdf.parse(dataAniv[0]);
					this.contato.setDataAniversario(dataIni);
				} catch(ParseException e) {
					this.mensagensErro.add("Data inválida para a data de aniversário!");
				}
				
			} else{
				this.mensagensErro.add("Formato inválido para a data de aniversário (use dd/mm/yyyy)!");
			}
		}
		
		// Recupera a operadora selecionada, a partir do seu id
		Operadora operadora= null;
		if(idOperadora != null && !idOperadora[0].isEmpty()) {
			OperadoraDAO opDao = new OperadoraDAO(PersistenceUtil.getCurrentEntityManager());
			operadora= opDao.find(Integer.parseInt(idOperadora[0]));
			contato.setOperadora(operadora);
		}
		
		return this.mensagensErro.isEmpty();
	}
}
