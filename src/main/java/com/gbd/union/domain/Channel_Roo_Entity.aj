// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.gbd.union.domain;

import com.gbd.union.domain.Channel;
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

privileged aspect Channel_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Channel.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer Channel.id;
    
    @Version
    @Column(name = "version")
    private Integer Channel.version;
    
    public Integer Channel.getId() {
        return this.id;
    }
    
    public void Channel.setId(Integer id) {
        this.id = id;
    }
    
    public Integer Channel.getVersion() {
        return this.version;
    }
    
    public void Channel.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Channel.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Channel.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Channel attached = this.entityManager.find(this.getClass(), this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Channel.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public Channel Channel.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Channel merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Channel.entityManager() {
        EntityManager em = new Channel().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Channel.countChannels() {
        return entityManager().createQuery("select count(o) from Channel o", Long.class).getSingleResult();
    }
    
    public static List<Channel> Channel.findAllChannels() {
        return entityManager().createQuery("select o from Channel o", Channel.class).getResultList();
    }
    
    public static Channel Channel.findChannel(Integer id) {
        if (id == null) return null;
        return entityManager().find(Channel.class, id);
    }
    
    public static List<Channel> Channel.findChannelEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Channel o", Channel.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}