// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.gbd.union.domain;

import com.gbd.union.domain.Channel;
import com.gbd.union.domain.Company;
import java.lang.Integer;
import java.lang.String;

privileged aspect CPRole_Roo_JavaBean {
    
    public String CPRole.getCommand() {
        return this.command;
    }
    
    public void CPRole.setCommand(String command) {
        this.command = command;
    }
    
    public String CPRole.getUrl() {
        return this.url;
    }
    
    public void CPRole.setUrl(String url) {
        this.url = url;
    }
    
    public Integer CPRole.getRate() {
        return this.rate;
    }
    
    public void CPRole.setRate(Integer rate) {
        this.rate = rate;
    }
    
    public Channel CPRole.getChannel() {
        return this.channel;
    }
    
    public void CPRole.setChannel(Channel channel) {
        this.channel = channel;
    }
    
    public Company CPRole.getCp() {
        return this.cp;
    }
    
    public void CPRole.setCp(Company cp) {
        this.cp = cp;
    }
    
}
