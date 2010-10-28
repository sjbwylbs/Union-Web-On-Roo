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
@Table(name = "t_province")
@Entity
@RooEntity(identifierField = "id", identifierColumn = "id", identifierType = Integer.class, finders = { "findProvincesByNameLike" })
public class Province {

    @NotNull
    @Size(max = 20)
    private String name;
}
