// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.gbd.union.domain;

import com.gbd.union.domain.StatusType;
import java.util.List;
import java.util.Random;
import org.springframework.stereotype.Component;

privileged aspect StatusTypeDataOnDemand_Roo_DataOnDemand {
    
    declare @type: StatusTypeDataOnDemand: @Component;
    
    private Random StatusTypeDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<StatusType> StatusTypeDataOnDemand.data;
    
    public StatusType StatusTypeDataOnDemand.getNewTransientStatusType(int index) {
        com.gbd.union.domain.StatusType obj = new com.gbd.union.domain.StatusType();
        java.lang.String name = "name_" + index;
        if (name.length() > 20) {
            name  = name.substring(0, 20);
        }
        obj.setName(name);
        return obj;
    }
    
    public StatusType StatusTypeDataOnDemand.getSpecificStatusType(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        StatusType obj = data.get(index);
        return StatusType.findStatusType(obj.getId());
    }
    
    public StatusType StatusTypeDataOnDemand.getRandomStatusType() {
        init();
        StatusType obj = data.get(rnd.nextInt(data.size()));
        return StatusType.findStatusType(obj.getId());
    }
    
    public boolean StatusTypeDataOnDemand.modifyStatusType(StatusType obj) {
        return false;
    }
    
    public void StatusTypeDataOnDemand.init() {
        data = com.gbd.union.domain.StatusType.findStatusTypeEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'StatusType' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new java.util.ArrayList<com.gbd.union.domain.StatusType>();
        for (int i = 0; i < 10; i++) {
            com.gbd.union.domain.StatusType obj = getNewTransientStatusType(i);
            obj.persist();
            obj.flush();
            data.add(obj);
        }
    }
    
}