package com.gbd.union.web;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.core.convert.support.GenericConversionService;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import com.gbd.union.domain.CPRole;
import com.gbd.union.domain.Channel;
import com.gbd.union.domain.Company;
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

@RooWebScaffold(path = "cproles", formBackingObject = CPRole.class)
@RequestMapping("/cproles")
@Controller
public class CPRoleController {

	@Autowired
    private GenericConversionService conversionService;

	@RequestMapping(method = RequestMethod.POST)
    public String create(@Valid CPRole cPRole, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("cPRole", cPRole);
            return "cproles/create";
        }
        cPRole.persist();
        return "redirect:/cproles/" + encodeUrlPathSegment(cPRole.getId().toString(), request);
    }

	@RequestMapping(params = "form", method = RequestMethod.GET)
    public String createForm(Model model) {
        model.addAttribute("cPRole", new CPRole());
        List dependencies = new ArrayList();
        if (Channel.countChannels() == 0) {
            dependencies.add(new String[]{"channel", "channels"});
        }
        if (Company.countCompanys() == 0) {
            dependencies.add(new String[]{"cp", "companys"});
        }
        model.addAttribute("dependencies", dependencies);
        return "cproles/create";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String show(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("cprole", CPRole.findCPRole(id));
        model.addAttribute("itemId", id);
        return "cproles/show";
    }

	@RequestMapping(method = RequestMethod.GET)
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("cproles", CPRole.findCPRoleEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) CPRole.countCPRoles() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("cproles", CPRole.findAllCPRoles());
        }
        return "cproles/list";
    }

	@RequestMapping(method = RequestMethod.PUT)
    public String update(@Valid CPRole cPRole, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("cPRole", cPRole);
            return "cproles/update";
        }
        cPRole.merge();
        return "redirect:/cproles/" + encodeUrlPathSegment(cPRole.getId().toString(), request);
    }

	@RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("cPRole", CPRole.findCPRole(id));
        return "cproles/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        CPRole.findCPRole(id).remove();
        model.addAttribute("page", (page == null) ? "1" : page.toString());
        model.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/cproles?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }

	@RequestMapping(params = { "find=ByChannel", "form" }, method = RequestMethod.GET)
    public String findCPRolesByChannelForm(Model model) {
        model.addAttribute("channels", Channel.findAllChannels());
        return "cproles/findCPRolesByChannel";
    }

	@RequestMapping(params = "find=ByChannel", method = RequestMethod.GET)
    public String findCPRolesByChannel(@RequestParam("channel") Channel channel, Model model) {
        model.addAttribute("cproles", CPRole.findCPRolesByChannel(channel).getResultList());
        return "cproles/list";
    }

	@ModelAttribute("channels")
    public Collection<Channel> populateChannels() {
        return Channel.findAllChannels();
    }

	@ModelAttribute("companys")
    public Collection<Company> populateCompanys() {
        return Company.findAllCompanys();
    }

	Converter<CPRole, String> getCPRoleConverter() {
        return new Converter<CPRole, String>() {
            public String convert(CPRole CPRole) {
                return new StringBuilder().append(CPRole.getCommand()).append(" ").append(CPRole.getUrl()).append(" ").append(CPRole.getRate()).toString();
            }
        };
    }

	Converter<Channel, String> getChannelConverter() {
        return new Converter<Channel, String>() {
            public String convert(Channel channel) {
                return new StringBuilder().append(channel.getSpcode()).append(" ").append(channel.getServiceId()).append(" ").append(channel.getCommand()).toString();
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

	@PostConstruct
    void registerConverters() {
        conversionService.addConverter(getCPRoleConverter());
        conversionService.addConverter(getChannelConverter());
        conversionService.addConverter(getCompanyConverter());
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
