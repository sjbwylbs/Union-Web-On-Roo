package com.gbd.union.web;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.core.convert.converter.Converter;
import org.springframework.core.convert.support.GenericConversionService;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import com.gbd.union.domain.City;
import com.gbd.union.domain.Company;
import com.gbd.union.domain.Message;
import com.gbd.union.domain.Province;
import com.gbd.union.domain.StatusType;
import com.gbd.union.reference.EventStatus;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "messages", formBackingObject = Message.class)
@RequestMapping("/messages")
@Controller
public class MessageController {

	@Autowired
    private GenericConversionService conversionService;

	@RequestMapping(method = RequestMethod.POST)
    public String create(@Valid Message message, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("message", message);
            addDateTimeFormatPatterns(model);
            return "messages/create";
        }
        message.persist();
        return "redirect:/messages/" + encodeUrlPathSegment(message.getId().toString(), request);
    }

	@RequestMapping(params = "form", method = RequestMethod.GET)
    public String createForm(Model model) {
        model.addAttribute("message", new Message());
        addDateTimeFormatPatterns(model);
        List dependencies = new ArrayList();
        if (StatusType.countStatusTypes() == 0) {
            dependencies.add(new String[]{"status", "statustypes"});
        }
        model.addAttribute("dependencies", dependencies);
        return "messages/create";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String show(@PathVariable("id") Long id, Model model) {
        addDateTimeFormatPatterns(model);
        model.addAttribute("message", Message.findMessage(id));
        model.addAttribute("itemId", id);
        return "messages/show";
    }

	@RequestMapping(method = RequestMethod.GET)
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("messages", Message.findMessageEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Message.countMessages() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("messages", Message.findAllMessages());
        }
        addDateTimeFormatPatterns(model);
        return "messages/list";
    }

	@RequestMapping(method = RequestMethod.PUT)
    public String update(@Valid Message message, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("message", message);
            addDateTimeFormatPatterns(model);
            return "messages/update";
        }
        message.merge();
        return "redirect:/messages/" + encodeUrlPathSegment(message.getId().toString(), request);
    }

	@RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Long id, Model model) {
        model.addAttribute("message", Message.findMessage(id));
        addDateTimeFormatPatterns(model);
        return "messages/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        Message.findMessage(id).remove();
        model.addAttribute("page", (page == null) ? "1" : page.toString());
        model.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/messages?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }

	@RequestMapping(params = { "find=ByMobile", "form" }, method = RequestMethod.GET)
    public String findMessagesByMobileForm(Model model) {
        return "messages/findMessagesByMobile";
    }

	@RequestMapping(params = "find=ByMobile", method = RequestMethod.GET)
    public String findMessagesByMobile(@RequestParam("mobile") Long mobile, Model model) {
        model.addAttribute("messages", Message.findMessagesByMobile(mobile).getResultList());
        return "messages/list";
    }

	@RequestMapping(params = { "find=ByCreatedBetween", "form" }, method = RequestMethod.GET)
    public String findMessagesByCreatedBetweenForm(Model model) {
        addDateTimeFormatPatterns(model);
        return "messages/findMessagesByCreatedBetween";
    }

	@RequestMapping(params = "find=ByCreatedBetween", method = RequestMethod.GET)
    public String findMessagesByCreatedBetween(@RequestParam("minCreated") @org.springframework.format.annotation.DateTimeFormat(style = "MM") Date minCreated, @RequestParam("maxCreated") @org.springframework.format.annotation.DateTimeFormat(style = "MM") Date maxCreated, Model model) {
        model.addAttribute("messages", Message.findMessagesByCreatedBetween(minCreated, maxCreated).getResultList());
        addDateTimeFormatPatterns(model);
        return "messages/list";
    }

	@RequestMapping(params = { "find=BySp", "form" }, method = RequestMethod.GET)
    public String findMessagesBySpForm(Model model) {
        model.addAttribute("companys", Company.findAllCompanys());
        return "messages/findMessagesBySp";
    }

	@RequestMapping(params = "find=BySp", method = RequestMethod.GET)
    public String findMessagesBySp(@RequestParam("sp") Company sp, Model model) {
        model.addAttribute("messages", Message.findMessagesBySp(sp).getResultList());
        return "messages/list";
    }

	@RequestMapping(params = { "find=ByCp", "form" }, method = RequestMethod.GET)
    public String findMessagesByCpForm(Model model) {
        model.addAttribute("companys", Company.findAllCompanys());
        return "messages/findMessagesByCp";
    }

	@RequestMapping(params = "find=ByCp", method = RequestMethod.GET)
    public String findMessagesByCp(@RequestParam("cp") Company cp, Model model) {
        model.addAttribute("messages", Message.findMessagesByCp(cp).getResultList());
        return "messages/list";
    }

	@RequestMapping(params = { "find=ByLinkId", "form" }, method = RequestMethod.GET)
    public String findMessagesByLinkIdForm(Model model) {
        return "messages/findMessagesByLinkId";
    }

	@RequestMapping(params = "find=ByLinkId", method = RequestMethod.GET)
    public String findMessagesByLinkId(@RequestParam("linkId") String linkId, Model model) {
        model.addAttribute("messages", Message.findMessagesByLinkId(linkId).getResultList());
        return "messages/list";
    }

	@ModelAttribute("citys")
    public Collection<City> populateCitys() {
        return City.findAllCitys();
    }

	@ModelAttribute("companys")
    public Collection<Company> populateCompanys() {
        return Company.findAllCompanys();
    }

	@ModelAttribute("provinces")
    public Collection<Province> populateProvinces() {
        return Province.findAllProvinces();
    }

	@ModelAttribute("statustypes")
    public Collection<StatusType> populateStatusTypes() {
        return StatusType.findAllStatusTypes();
    }

	@ModelAttribute("eventstatuses")
    public Collection<EventStatus> populateEventStatuses() {
        return Arrays.asList(EventStatus.class.getEnumConstants());
    }

	Converter<City, String> getCityConverter() {
        return new Converter<City, String>() {
            public String convert(City city) {
                return new StringBuilder().append(city.getName()).append(" ").append(city.getZIP()).toString();
            }
        };
    }

	Converter<Company, String> getCompanyConverter() {
        return new Converter<Company, String>() {
            public String convert(Company company) {
                return new StringBuilder().append(company.getName()).append(" ").append(company.getAddress()).append(" ").append(company.getBankUserName()).toString();
            }
        };
    }

	Converter<Message, String> getMessageConverter() {
        return new Converter<Message, String>() {
            public String convert(Message message) {
                return new StringBuilder().append(message.getMobile()).append(" ").append(message.getCommand()).append(" ").append(message.getSpcode()).toString();
            }
        };
    }

	Converter<Province, String> getProvinceConverter() {
        return new Converter<Province, String>() {
            public String convert(Province province) {
                return new StringBuilder().append(province.getName()).toString();
            }
        };
    }

	Converter<StatusType, String> getStatusTypeConverter() {
        return new Converter<StatusType, String>() {
            public String convert(StatusType statusType) {
                return new StringBuilder().append(statusType.getName()).toString();
            }
        };
    }

	@PostConstruct
    void registerConverters() {
        conversionService.addConverter(getCityConverter());
        conversionService.addConverter(getCompanyConverter());
        conversionService.addConverter(getMessageConverter());
        conversionService.addConverter(getProvinceConverter());
        conversionService.addConverter(getStatusTypeConverter());
    }

	void addDateTimeFormatPatterns(Model model) {
        model.addAttribute("message_syned_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        model.addAttribute("message_updated_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        model.addAttribute("message_mincreated_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        model.addAttribute("message_created_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        model.addAttribute("message_maxcreated_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }

	private String encodeUrlPathSegment(String pathSegment, HttpServletRequest request) {
        String enc = request.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
}
