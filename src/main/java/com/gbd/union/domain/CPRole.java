package com.gbd.union.domain;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.validation.constraints.Min;
import javax.validation.constraints.Max;
import com.gbd.union.domain.Channel;
import javax.persistence.ManyToOne;
import com.gbd.union.domain.Company;

@RooJavaBean
@RooToString
@Table(name = "t_cprole")
@Entity
@RooEntity(identifierField = "id", identifierColumn = "id", identifierType = Integer.class, finders = { "findCPRolesByChannel" })
public class CPRole {

    @NotNull
    @Size(max = 100)
    private String command;

    @NotNull
    @Size(max = 200)
    private String url;

    @NotNull
    @Min(0L)
    @Max(100L)
    private Integer rate;

    @NotNull
    @ManyToOne
    private Channel channel;

    @NotNull
    @ManyToOne
    private Company cp;
}
