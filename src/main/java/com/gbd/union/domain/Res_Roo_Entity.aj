// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.gbd.union.domain;

import com.gbd.union.domain.Res;
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

privileged aspect Res_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Res.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer Res.id;
    
    @Version
    @Column(name = "version")
    private Integer Res.version;
    
    public Integer Res.getId() {
        return this.id;
    }
    
    public void Res.setId(Integer id) {
        this.id = id;
    }
    
    public Integer Res.getVersion() {
        return this.version;
    }
    
    public void Res.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Res.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Res.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Res attached = this.entityManager.find(this.getClass(), this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Res.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public Res Res.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Res merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Res.entityManager() {
        EntityManager em = new Res().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Res.countReses() {
        return entityManager().createQuery("select count(o) from Res o", Long.class).getSingleResult();
    }
    
    public static List<Res> Res.findAllReses() {
        return entityManager().createQuery("select o from Res o", Res.class).getResultList();
    }
    
    public static Res Res.findRes(Integer id) {
        if (id == null) return null;
        return entityManager().find(Res.class, id);
    }
    
    public static List<Res> Res.findResEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Res o", Res.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}