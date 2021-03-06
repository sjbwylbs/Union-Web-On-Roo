// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.gbd.union.domain;

import com.gbd.union.domain.CompanyDataOnDemand;
import com.gbd.union.domain.Contact;
import com.gbd.union.domain.ContactTypeDataOnDemand;
import java.util.List;
import java.util.Random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect ContactDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ContactDataOnDemand: @Component;
    
    private Random ContactDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<Contact> ContactDataOnDemand.data;
    
    @Autowired
    private CompanyDataOnDemand ContactDataOnDemand.companyDataOnDemand;
    
    @Autowired
    private ContactTypeDataOnDemand ContactDataOnDemand.contactTypeDataOnDemand;
    
    public Contact ContactDataOnDemand.getNewTransientContact(int index) {
        com.gbd.union.domain.Contact obj = new com.gbd.union.domain.Contact();
        obj.setCompany(companyDataOnDemand.getRandomCompany());
        obj.setContactType(contactTypeDataOnDemand.getRandomContactType());
        java.lang.String email = "email_" + index;
        if (email.length() > 50) {
            email  = email.substring(0, 50);
        }
        obj.setEmail(email);
        java.lang.String mobile = "mobile_" + index;
        if (mobile.length() > 21) {
            mobile  = mobile.substring(0, 21);
        }
        obj.setMobile(mobile);
        java.lang.String name = "name_" + index;
        if (name.length() > 8) {
            name  = name.substring(0, 8);
        }
        obj.setName(name);
        java.lang.String qq = "qq_" + index;
        if (qq.length() > 21) {
            qq  = qq.substring(0, 21);
        }
        obj.setQq(qq);
        return obj;
    }
    
    public Contact ContactDataOnDemand.getSpecificContact(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Contact obj = data.get(index);
        return Contact.findContact(obj.getId());
    }
    
    public Contact ContactDataOnDemand.getRandomContact() {
        init();
        Contact obj = data.get(rnd.nextInt(data.size()));
        return Contact.findContact(obj.getId());
    }
    
    public boolean ContactDataOnDemand.modifyContact(Contact obj) {
        return false;
    }
    
    public void ContactDataOnDemand.init() {
        data = com.gbd.union.domain.Contact.findContactEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Contact' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new java.util.ArrayList<com.gbd.union.domain.Contact>();
        for (int i = 0; i < 10; i++) {
            com.gbd.union.domain.Contact obj = getNewTransientContact(i);
            obj.persist();
            obj.flush();
            data.add(obj);
        }
    }
    
}
