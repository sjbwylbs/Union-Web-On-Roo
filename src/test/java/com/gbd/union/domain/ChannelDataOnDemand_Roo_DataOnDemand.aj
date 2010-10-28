// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.gbd.union.domain;

import com.gbd.union.domain.Channel;
import com.gbd.union.domain.CompanyDataOnDemand;
import java.util.List;
import java.util.Random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect ChannelDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ChannelDataOnDemand: @Component;
    
    private Random ChannelDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<Channel> ChannelDataOnDemand.data;
    
    @Autowired
    private CompanyDataOnDemand ChannelDataOnDemand.companyDataOnDemand;
    
    public Channel ChannelDataOnDemand.getNewTransientChannel(int index) {
        com.gbd.union.domain.Channel obj = new com.gbd.union.domain.Channel();
        obj.setChannelType(com.gbd.union.reference.ChannelType.class.getEnumConstants()[0]);
        java.lang.String command = "command_" + index;
        if (command.length() > 100) {
            command  = command.substring(0, 100);
        }
        obj.setCommand(command);
        obj.setCommandType(com.gbd.union.reference.CommandType.class.getEnumConstants()[0]);
        obj.setCompany(companyDataOnDemand.getRandomCompany());
        java.lang.String confirmProvince = "confirmProvince_" + index;
        if (confirmProvince.length() > 500) {
            confirmProvince  = confirmProvince.substring(0, 500);
        }
        obj.setConfirmProvince(confirmProvince);
        java.lang.Integer fee = new Integer(index);
        if (fee < 10 || fee > 9000) {
            fee = 9000;
        }
        obj.setFee(fee);
        java.lang.String serviceId = "serviceId_" + index;
        if (serviceId.length() > 20) {
            serviceId  = serviceId.substring(0, 20);
        }
        obj.setServiceId(serviceId);
        obj.setServiceProvider(com.gbd.union.reference.ServiceProvider.class.getEnumConstants()[0]);
        java.lang.String serviceProvince = "serviceProvince_" + index;
        if (serviceProvince.length() > 500) {
            serviceProvince  = serviceProvince.substring(0, 500);
        }
        obj.setServiceProvince(serviceProvince);
        java.lang.String spcode = "spcode_" + index;
        if (spcode.length() > 20) {
            spcode  = spcode.substring(0, 20);
        }
        obj.setSpcode(spcode);
        return obj;
    }
    
    public Channel ChannelDataOnDemand.getSpecificChannel(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Channel obj = data.get(index);
        return Channel.findChannel(obj.getId());
    }
    
    public Channel ChannelDataOnDemand.getRandomChannel() {
        init();
        Channel obj = data.get(rnd.nextInt(data.size()));
        return Channel.findChannel(obj.getId());
    }
    
    public boolean ChannelDataOnDemand.modifyChannel(Channel obj) {
        return false;
    }
    
    public void ChannelDataOnDemand.init() {
        data = com.gbd.union.domain.Channel.findChannelEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Channel' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new java.util.ArrayList<com.gbd.union.domain.Channel>();
        for (int i = 0; i < 10; i++) {
            com.gbd.union.domain.Channel obj = getNewTransientChannel(i);
            obj.persist();
            obj.flush();
            data.add(obj);
        }
    }
    
}