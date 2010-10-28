package com.gbd.union.domain;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import com.gbd.union.reference.CompanyType;
import javax.persistence.Enumerated;
import com.gbd.union.domain.Person;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooEntity(identifierField = "id", identifierColumn = "id", identifierType = Integer.class)
@Table(name = "t_company")
@Entity
public class Company {

    @NotNull
    @Size(max = 30)
    private String name;

    @Size(max = 100)
    private String address;

    @NotNull
    @Enumerated
    private CompanyType companyType;

    @Size(max = 8)
    private String bankUserName;

    @Size(max = 30)
    private String bankName;

    @Size(max = 50)
    private String bankAddress;

    @Size(max = 20)
    private String bankNumber;

    @NotNull
    @ManyToOne
    private Person person;
}
