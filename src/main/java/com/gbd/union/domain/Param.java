package com.gbd.union.domain;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import com.gbd.union.domain.Company;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooEntity(identifierField = "id", identifierColumn = "id", identifierType = Integer.class)
@Table(name = "t_param")
@Entity
public class Param {

    @NotNull
    @Size(max = 20)
    private String mobileParam;

    @NotNull
    @Size(max = 20)
    private String commandParam;

    @NotNull
    @Size(max = 20)
    private String spcodeParam;

    @NotNull
    @Size(max = 20)
    private String serviceIdParam;

    @NotNull
    @Size(max = 20)
    private String linkIdParam;

    @NotNull
    @Size(max = 20)
    private String provinceParam;

    @NotNull
    @Size(max = 20)
    private String cityParam;

    @NotNull
    @Size(max = 20)
    private String createdParam;

    @NotNull
    @Size(max = 20)
    private String statusParam;

    @NotNull
    @ManyToOne
    private Company company;
}
