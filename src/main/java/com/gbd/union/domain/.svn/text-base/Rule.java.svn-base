package com.gbd.union.domain;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Set;
import javax.persistence.ManyToMany;
import javax.persistence.CascadeType;

@RooJavaBean
@RooToString
@RooEntity(identifierField = "id", identifierColumn = "id", identifierType = Integer.class)
@Table(name = "t_rule")
@Entity
public class Rule {

    @NotNull
    @Size(max = 20)
    private String name;

    @NotNull
    @Size(max = 30)
    private String descn;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<com.gbd.union.domain.Res> res = new java.util.HashSet<com.gbd.union.domain.Res>();

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<com.gbd.union.domain.Person> person = new java.util.HashSet<com.gbd.union.domain.Person>();
}
