// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.gbd.union.domain;

import com.gbd.union.domain.StatusType;
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

privileged aspect StatusType_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager StatusType.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer StatusType.id;
    
    @Version
    @Column(name = "version")
    private Integer StatusType.version;
    
    public Integer StatusType.getId() {
        return this.id;
    }
    
    public void StatusType.setId(Integer id) {
        this.id = id;
    }
    
    public Integer StatusType.getVersion() {
        return this.version;
    }
    
    public void StatusType.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void StatusType.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void StatusType.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            StatusType attached = this.entityManager.find(this.getClass(), this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void StatusType.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public StatusType StatusType.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        StatusType merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager StatusType.entityManager() {
        EntityManager em = new StatusType().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long StatusType.countStatusTypes() {
        return entityManager().createQuery("select count(o) from StatusType o", Long.class).getSingleResult();
    }
    
    public static List<StatusType> StatusType.findAllStatusTypes() {
        return entityManager().createQuery("select o from StatusType o", StatusType.class).getResultList();
    }
    
    public static StatusType StatusType.findStatusType(Integer id) {
        if (id == null) return null;
        return entityManager().find(StatusType.class, id);
    }
    
    public static List<StatusType> StatusType.findStatusTypeEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from StatusType o", StatusType.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
