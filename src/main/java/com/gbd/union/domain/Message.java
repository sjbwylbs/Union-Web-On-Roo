package com.gbd.union.domain;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Min;
import javax.validation.constraints.Max;
import javax.validation.constraints.Size;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import com.gbd.union.reference.EventStatus;
import javax.persistence.Enumerated;
import com.gbd.union.domain.Province;
import javax.persistence.ManyToOne;
import com.gbd.union.domain.City;
import com.gbd.union.domain.StatusType;
import com.gbd.union.domain.Company;

@RooJavaBean
@RooToString
@Table(name = "t_message")
@Entity
@RooEntity(identifierField = "id", identifierColumn = "id", finders = { "findMessagesByMobile", "findMessagesByCreatedBetween", "findMessagesBySp", "findMessagesByCp", "findMessagesByLinkId" })
public class Message {

    @NotNull
    @Min(10000000000L)
    @Max(20000000000L)
    private Long mobile;

    @NotNull
    @Size(max = 100)
    private String command;

    @NotNull
    @Size(max = 20)
    private String spcode;

    @Size(max = 20)
    private String serviceId;

    @Size(max = 20)
    private String linkId;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM")
    private Date created;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM")
    private Date updated;

    @Enumerated
    private EventStatus synStatus;

    @Min(0L)
    @Max(10L)
    private Integer synTimes;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM")
    private Date syned;

    @NotNull
    private Boolean isEnable;

    @ManyToOne
    private Province province;

    @ManyToOne
    private City city;

    @NotNull
    @ManyToOne
    private StatusType status;

    @ManyToOne
    private Company cp;

    @ManyToOne
    private Company sp;
}
