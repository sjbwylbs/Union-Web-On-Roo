// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.gbd.union.domain;

import java.lang.String;

privileged aspect Param_Roo_ToString {
    
    public String Param.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("MobileParam: ").append(getMobileParam()).append(", ");
        sb.append("CommandParam: ").append(getCommandParam()).append(", ");
        sb.append("SpcodeParam: ").append(getSpcodeParam()).append(", ");
        sb.append("ServiceIdParam: ").append(getServiceIdParam()).append(", ");
        sb.append("LinkIdParam: ").append(getLinkIdParam()).append(", ");
        sb.append("ProvinceParam: ").append(getProvinceParam()).append(", ");
        sb.append("CityParam: ").append(getCityParam()).append(", ");
        sb.append("CreatedParam: ").append(getCreatedParam()).append(", ");
        sb.append("StatusParam: ").append(getStatusParam()).append(", ");
        sb.append("Company: ").append(getCompany());
        return sb.toString();
    }
    
}
