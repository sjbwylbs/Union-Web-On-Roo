// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.gbd.union.domain;

import com.gbd.union.domain.CompanyDataOnDemand;
import com.gbd.union.domain.Param;
import java.util.List;
import java.util.Random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect ParamDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ParamDataOnDemand: @Component;
    
    private Random ParamDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<Param> ParamDataOnDemand.data;
    
    @Autowired
    private CompanyDataOnDemand ParamDataOnDemand.companyDataOnDemand;
    
    public Param ParamDataOnDemand.getNewTransientParam(int index) {
        com.gbd.union.domain.Param obj = new com.gbd.union.domain.Param();
        java.lang.String cityParam = "cityParam_" + index;
        if (cityParam.length() > 20) {
            cityParam  = cityParam.substring(0, 20);
        }
        obj.setCityParam(cityParam);
        java.lang.String commandParam = "commandParam_" + index;
        if (commandParam.length() > 20) {
            commandParam  = commandParam.substring(0, 20);
        }
        obj.setCommandParam(commandParam);
        obj.setCompany(companyDataOnDemand.getRandomCompany());
        java.lang.String createdParam = "createdParam_" + index;
        if (createdParam.length() > 20) {
            createdParam  = createdParam.substring(0, 20);
        }
        obj.setCreatedParam(createdParam);
        java.lang.String linkIdParam = "linkIdParam_" + index;
        if (linkIdParam.length() > 20) {
            linkIdParam  = linkIdParam.substring(0, 20);
        }
        obj.setLinkIdParam(linkIdParam);
        java.lang.String mobileParam = "mobileParam_" + index;
        if (mobileParam.length() > 20) {
            mobileParam  = mobileParam.substring(0, 20);
        }
        obj.setMobileParam(mobileParam);
        java.lang.String provinceParam = "provinceParam_" + index;
        if (provinceParam.length() > 20) {
            provinceParam  = provinceParam.substring(0, 20);
        }
        obj.setProvinceParam(provinceParam);
        java.lang.String serviceIdParam = "serviceIdParam_" + index;
        if (serviceIdParam.length() > 20) {
            serviceIdParam  = serviceIdParam.substring(0, 20);
        }
        obj.setServiceIdParam(serviceIdParam);
        java.lang.String spcodeParam = "spcodeParam_" + index;
        if (spcodeParam.length() > 20) {
            spcodeParam  = spcodeParam.substring(0, 20);
        }
        obj.setSpcodeParam(spcodeParam);
        java.lang.String statusParam = "statusParam_" + index;
        if (statusParam.length() > 20) {
            statusParam  = statusParam.substring(0, 20);
        }
        obj.setStatusParam(statusParam);
        return obj;
    }
    
    public Param ParamDataOnDemand.getSpecificParam(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Param obj = data.get(index);
        return Param.findParam(obj.getId());
    }
    
    public Param ParamDataOnDemand.getRandomParam() {
        init();
        Param obj = data.get(rnd.nextInt(data.size()));
        return Param.findParam(obj.getId());
    }
    
    public boolean ParamDataOnDemand.modifyParam(Param obj) {
        return false;
    }
    
    public void ParamDataOnDemand.init() {
        data = com.gbd.union.domain.Param.findParamEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Param' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new java.util.ArrayList<com.gbd.union.domain.Param>();
        for (int i = 0; i < 10; i++) {
            com.gbd.union.domain.Param obj = getNewTransientParam(i);
            obj.persist();
            obj.flush();
            data.add(obj);
        }
    }
    
}
