package com.gbd.union.domain;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooEntity(identifierField = "id", identifierColumn = "id", identifierType = Integer.class)
@Table(name = "t_contacttype")
@Entity
public class ContactType {

    @NotNull
    @Size(max = 20)
    private String name;
}
