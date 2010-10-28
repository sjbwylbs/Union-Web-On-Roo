// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.gbd.union.domain;

import com.gbd.union.domain.City;
import com.gbd.union.domain.Company;
import com.gbd.union.domain.Province;
import com.gbd.union.domain.StatusType;
import com.gbd.union.reference.EventStatus;
import java.lang.Boolean;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Date;

privileged aspect Message_Roo_JavaBean {
    
    public Long Message.getMobile() {
        return this.mobile;
    }
    
    public void Message.setMobile(Long mobile) {
        this.mobile = mobile;
    }
    
    public String Message.getCommand() {
        return this.command;
    }
    
    public void Message.setCommand(String command) {
        this.command = command;
    }
    
    public String Message.getSpcode() {
        return this.spcode;
    }
    
    public void Message.setSpcode(String spcode) {
        this.spcode = spcode;
    }
    
    public String Message.getServiceId() {
        return this.serviceId;
    }
    
    public void Message.setServiceId(String serviceId) {
        this.serviceId = serviceId;
    }
    
    public String Message.getLinkId() {
        return this.linkId;
    }
    
    public void Message.setLinkId(String linkId) {
        this.linkId = linkId;
    }
    
    public Date Message.getCreated() {
        return this.created;
    }
    
    public void Message.setCreated(Date created) {
        this.created = created;
    }
    
    public Date Message.getUpdated() {
        return this.updated;
    }
    
    public void Message.setUpdated(Date updated) {
        this.updated = updated;
    }
    
    public EventStatus Message.getSynStatus() {
        return this.synStatus;
    }
    
    public void Message.setSynStatus(EventStatus synStatus) {
        this.synStatus = synStatus;
    }
    
    public Integer Message.getSynTimes() {
        return this.synTimes;
    }
    
    public void Message.setSynTimes(Integer synTimes) {
        this.synTimes = synTimes;
    }
    
    public Date Message.getSyned() {
        return this.syned;
    }
    
    public void Message.setSyned(Date syned) {
        this.syned = syned;
    }
    
    public Boolean Message.getIsEnable() {
        return this.isEnable;
    }
    
    public void Message.setIsEnable(Boolean isEnable) {
        this.isEnable = isEnable;
    }
    
    public Province Message.getProvince() {
        return this.province;
    }
    
    public void Message.setProvince(Province province) {
        this.province = province;
    }
    
    public City Message.getCity() {
        return this.city;
    }
    
    public void Message.setCity(City city) {
        this.city = city;
    }
    
    public StatusType Message.getStatus() {
        return this.status;
    }
    
    public void Message.setStatus(StatusType status) {
        this.status = status;
    }
    
    public Company Message.getCp() {
        return this.cp;
    }
    
    public void Message.setCp(Company cp) {
        this.cp = cp;
    }
    
    public Company Message.getSp() {
        return this.sp;
    }
    
    public void Message.setSp(Company sp) {
        this.sp = sp;
    }
    
}
