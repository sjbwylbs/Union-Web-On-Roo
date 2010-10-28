package com.gbd.union.domain;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;
import com.gbd.union.domain.City;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooEntity(identifierField = "id", identifierColumn = "id")
@Table(name = "t_mobilecity")
@Entity
public class MobileCity {

    @NotNull
    private Integer mobilePrefix;

    @NotNull
    @ManyToOne
    private City city;
}
