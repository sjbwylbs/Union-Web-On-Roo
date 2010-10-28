package com.gbd.union.domain;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import com.gbd.union.domain.Province;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@Table(name = "t_city")
@Entity
@RooEntity(identifierField = "id", identifierColumn = "id", identifierType = Integer.class, finders = { "findCitysByNameLikeAndProvince" })
public class City {

    @NotNull
    @Size(max = 20)
    private String name;

    @NotNull
    @Size(max = 10)
    private String ZIP;

    @NotNull
    @ManyToOne
    private Province province;
}
