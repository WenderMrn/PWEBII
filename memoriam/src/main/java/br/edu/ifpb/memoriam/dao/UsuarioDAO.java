package br.edu.ifpb.memoriam.dao;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import br.edu.ifpb.memoriam.entity.Usuario;

public class UsuarioDAO extends GenericDAO<Usuario, Integer> {
	
	public UsuarioDAO() {
		this(PersistenceUtil.getCurrentEntityManager());
	}

	public UsuarioDAO(EntityManager em) {
		super(em);
	}

	public Usuario findByLogin(String login) {
		Query q = this.getEntityManager().createQuery("from Usuario u where u.email = :login");
        q.setParameter("login", login);
        Usuario u = null;
        try {
            u = (Usuario) q.getSingleResult();
        }catch (NoResultException e) {        
        }
        return u; 
	}
	
}
