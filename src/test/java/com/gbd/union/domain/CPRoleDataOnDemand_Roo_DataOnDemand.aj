// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.gbd.union.domain;

import com.gbd.union.domain.CPRole;
import com.gbd.union.domain.ChannelDataOnDemand;
import com.gbd.union.domain.CompanyDataOnDemand;
import java.util.List;
import java.util.Random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect CPRoleDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CPRoleDataOnDemand: @Component;
    
    private Random CPRoleDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<CPRole> CPRoleDataOnDemand.data;
    
    @Autowired
    private ChannelDataOnDemand CPRoleDataOnDemand.channelDataOnDemand;
    
    @Autowired
    private CompanyDataOnDemand CPRoleDataOnDemand.companyDataOnDemand;
    
    public CPRole CPRoleDataOnDemand.getNewTransientCPRole(int index) {
        com.gbd.union.domain.CPRole obj = new com.gbd.union.domain.CPRole();
        obj.setChannel(channelDataOnDemand.getRandomChannel());
        java.lang.String command = "command_" + index;
        if (command.length() > 100) {
            command  = command.substring(0, 100);
        }
        obj.setCommand(command);
        obj.setCp(companyDataOnDemand.getRandomCompany());
        java.lang.Integer rate = new Integer(index);
        if (rate < 0 || rate > 100) {
            rate = 100;
        }
        obj.setRate(rate);
        java.lang.String url = "url_" + index;
        if (url.length() > 200) {
            url  = url.substring(0, 200);
        }
        obj.setUrl(url);
        return obj;
    }
    
    public CPRole CPRoleDataOnDemand.getSpecificCPRole(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        CPRole obj = data.get(index);
        return CPRole.findCPRole(obj.getId());
    }
    
    public CPRole CPRoleDataOnDemand.getRandomCPRole() {
        init();
        CPRole obj = data.get(rnd.nextInt(data.size()));
        return CPRole.findCPRole(obj.getId());
    }
    
    public boolean CPRoleDataOnDemand.modifyCPRole(CPRole obj) {
        return false;
    }
    
    public void CPRoleDataOnDemand.init() {
        data = com.gbd.union.domain.CPRole.findCPRoleEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'CPRole' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new java.util.ArrayList<com.gbd.union.domain.CPRole>();
        for (int i = 0; i < 10; i++) {
            com.gbd.union.domain.CPRole obj = getNewTransientCPRole(i);
            obj.persist();
            obj.flush();
            data.add(obj);
        }
    }
    
}