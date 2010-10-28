// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.gbd.union.domain;

import com.gbd.union.domain.Param;
import java.lang.Integer;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Param_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Param.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer Param.id;
    
    @Version
    @Column(name = "version")
    private Integer Param.version;
    
    public Integer Param.getId() {
        return this.id;
    }
    
    public void Param.setId(Integer id) {
        this.id = id;
    }
    
    public Integer Param.getVersion() {
        return this.version;
    }
    
    public void Param.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Param.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Param.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Param attached = this.entityManager.find(this.getClass(), this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Param.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public Param Param.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Param merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Param.entityManager() {
        EntityManager em = new Param().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Param.countParams() {
        return entityManager().createQuery("select count(o) from Param o", Long.class).getSingleResult();
    }
    
    public static List<Param> Param.findAllParams() {
        return entityManager().createQuery("select o from Param o", Param.class).getResultList();
    }
    
    public static Param Param.findParam(Integer id) {
        if (id == null) return null;
        return entityManager().find(Param.class, id);
    }
    
    public static List<Param> Param.findParamEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Param o", Param.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}