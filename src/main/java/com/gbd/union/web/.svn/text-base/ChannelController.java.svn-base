package com.gbd.union.web;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.core.convert.support.GenericConversionService;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import com.gbd.union.domain.Channel;
import com.gbd.union.domain.Company;
import com.gbd.union.reference.ChannelType;
import com.gbd.union.reference.CommandType;
import com.gbd.union.reference.ServiceProvider;
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

@RooWebScaffold(path = "channels", formBackingObject = Channel.class)
@RequestMapping("/channels")
@Controller
public class ChannelController {

	@Autowired
    private GenericConversionService conversionService;

	@RequestMapping(method = RequestMethod.POST)
    public String create(@Valid Channel channel, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("channel", channel);
            return "channels/create";
        }
        channel.persist();
        return "redirect:/channels/" + encodeUrlPathSegment(channel.getId().toString(), request);
    }

	@RequestMapping(params = "form", method = RequestMethod.GET)
    public String createForm(Model model) {
        model.addAttribute("channel", new Channel());
        List dependencies = new ArrayList();
        if (Company.countCompanys() == 0) {
            dependencies.add(new String[]{"company", "companys"});
        }
        model.addAttribute("dependencies", dependencies);
        return "channels/create";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String show(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("channel", Channel.findChannel(id));
        model.addAttribute("itemId", id);
        return "channels/show";
    }

	@RequestMapping(method = RequestMethod.GET)
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("channels", Channel.findChannelEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Channel.countChannels() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("channels", Channel.findAllChannels());
        }
        return "channels/list";
    }

	@RequestMapping(method = RequestMethod.PUT)
    public String update(@Valid Channel channel, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("channel", channel);
            return "channels/update";
        }
        channel.merge();
        return "redirect:/channels/" + encodeUrlPathSegment(channel.getId().toString(), request);
    }

	@RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("channel", Channel.findChannel(id));
        return "channels/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        Channel.findChannel(id).remove();
        model.addAttribute("page", (page == null) ? "1" : page.toString());
        model.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/channels?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }

	@RequestMapping(params = { "find=ByCommand", "form" }, method = RequestMethod.GET)
    public String findChannelsByCommandForm(Model model) {
        return "channels/findChannelsByCommand";
    }

	@RequestMapping(params = "find=ByCommand", method = RequestMethod.GET)
    public String findChannelsByCommand(@RequestParam("command") String command, Model model) {
        model.addAttribute("channels", Channel.findChannelsByCommand(command).getResultList());
        return "channels/list";
    }

	@RequestMapping(params = { "find=BySpcode", "form" }, method = RequestMethod.GET)
    public String findChannelsBySpcodeForm(Model model) {
        return "channels/findChannelsBySpcode";
    }

	@RequestMapping(params = "find=BySpcode", method = RequestMethod.GET)
    public String findChannelsBySpcode(@RequestParam("spcode") String spcode, Model model) {
        model.addAttribute("channels", Channel.findChannelsBySpcode(spcode).getResultList());
        return "channels/list";
    }

	@ModelAttribute("companys")
    public Collection<Company> populateCompanys() {
        return Company.findAllCompanys();
    }

	@ModelAttribute("channeltypes")
    public Collection<ChannelType> populateChannelTypes() {
        return Arrays.asList(ChannelType.class.getEnumConstants());
    }

	@ModelAttribute("commandtypes")
    public Collection<CommandType> populateCommandTypes() {
        return Arrays.asList(CommandType.class.getEnumConstants());
    }

	@ModelAttribute("serviceproviders")
    public Collection<ServiceProvider> populateServiceProviders() {
        return Arrays.asList(ServiceProvider.class.getEnumConstants());
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
