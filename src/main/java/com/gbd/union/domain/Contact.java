package com.gbd.union.domain;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import com.gbd.union.domain.ContactType;
import javax.persistence.ManyToOne;
import com.gbd.union.domain.Company;

@RooJavaBean
@RooToString
@RooEntity(identifierField = "id", identifierColumn = "id", identifierType = Integer.class)
@Table(name = "t_contact")
@Entity
public class Contact {

    @NotNull
    @Size(max = 8)
    private String name;

    @Size(max = 21)
    private String mobile;

    @Size(max = 21)
    private String qq;

    @Size(max = 50)
    private String email;

    @NotNull
    @ManyToOne
    private ContactType contactType;

    @NotNull
    @ManyToOne
    private Company company;
}
