// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.gbd.union.domain;

import com.gbd.union.domain.CPRole;
import com.gbd.union.domain.Channel;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect CPRole_Roo_Finder {
    
    public static TypedQuery<CPRole> CPRole.findCPRolesByChannel(Channel channel) {
        if (channel == null) throw new IllegalArgumentException("The channel argument is required");
        EntityManager em = CPRole.entityManager();
        TypedQuery<CPRole> q = em.createQuery("SELECT CPRole FROM CPRole AS cprole WHERE cprole.channel = :channel", CPRole.class);
        q.setParameter("channel", channel);
        return q;
    }
    
}