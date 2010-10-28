package com.gbd.union.domain;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import com.gbd.union.reference.CommandType;
import javax.persistence.Enumerated;
import javax.validation.constraints.Min;
import javax.validation.constraints.Max;
import com.gbd.union.reference.ChannelType;
import com.gbd.union.reference.ServiceProvider;
import com.gbd.union.domain.Company;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@Table(name = "t_channel")
@Entity
@RooEntity(identifierField = "id", identifierColumn = "id", identifierType = Integer.class, finders = { "findChannelsByCommand", "findChannelsBySpcode" })
public class Channel {

    @NotNull
    @Size(max = 20)
    private String spcode;

    @NotNull
    @Size(max = 20)
    private String serviceId;

    @NotNull
    @Size(max = 100)
    private String command;

    @NotNull
    @Enumerated
    private CommandType commandType;

    @NotNull
    @Min(10L)
    @Max(9000L)
    private Integer fee;

    @Size(max = 500)
    private String serviceProvince;

    @Size(max = 500)
    private String confirmProvince;

    @NotNull
    @Enumerated
    private ChannelType channelType;

    @NotNull
    @Enumerated
    private ServiceProvider serviceProvider;

    @NotNull
    @ManyToOne
    private Company company;
}
