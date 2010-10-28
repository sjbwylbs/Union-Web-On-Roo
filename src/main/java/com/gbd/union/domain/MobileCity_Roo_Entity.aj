// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.gbd.union.domain;

import com.gbd.union.domain.MobileCity;
import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect MobileCity_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager MobileCity.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long MobileCity.id;
    
    @Version
    @Column(name = "version")
    private Integer MobileCity.version;
    
    public Long MobileCity.getId() {
        return this.id;
    }
    
    public void MobileCity.setId(Long id) {
        this.id = id;
    }
    
    public Integer MobileCity.getVersion() {
        return this.version;
    }
    
    public void MobileCity.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void MobileCity.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void MobileCity.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            MobileCity attached = this.entityManager.find(this.getClass(), this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void MobileCity.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public MobileCity MobileCity.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        MobileCity merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager MobileCity.entityManager() {
        EntityManager em = new MobileCity().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long MobileCity.countMobileCitys() {
        return entityManager().createQuery("select count(o) from MobileCity o", Long.class).getSingleResult();
    }
    
    public static List<MobileCity> MobileCity.findAllMobileCitys() {
        return entityManager().createQuery("select o from MobileCity o", MobileCity.class).getResultList();
    }
    
    public static MobileCity MobileCity.findMobileCity(Long id) {
        if (id == null) return null;
        return entityManager().find(MobileCity.class, id);
    }
    
    public static List<MobileCity> MobileCity.findMobileCityEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from MobileCity o", MobileCity.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
