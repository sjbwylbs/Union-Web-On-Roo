package com.gbd.union.web;

import java.io.UnsupportedEncodingException;
import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.core.convert.support.GenericConversionService;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import com.gbd.union.domain.StatusType;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "statustypes", formBackingObject = StatusType.class)
@RequestMapping("/statustypes")
@Controller
public class StatusTypeController {

	@Autowired
    private GenericConversionService conversionService;

	@RequestMapping(method = RequestMethod.POST)
    public String create(@Valid StatusType statusType, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("statusType", statusType);
            return "statustypes/create";
        }
        statusType.persist();
        return "redirect:/statustypes/" + encodeUrlPathSegment(statusType.getId().toString(), request);
    }

	@RequestMapping(params = "form", method = RequestMethod.GET)
    public String createForm(Model model) {
        model.addAttribute("statusType", new StatusType());
        return "statustypes/create";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String show(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("statustype", StatusType.findStatusType(id));
        model.addAttribute("itemId", id);
        return "statustypes/show";
    }

	@RequestMapping(method = RequestMethod.GET)
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("statustypes", StatusType.findStatusTypeEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) StatusType.countStatusTypes() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("statustypes", StatusType.findAllStatusTypes());
        }
        return "statustypes/list";
    }

	@RequestMapping(method = RequestMethod.PUT)
    public String update(@Valid StatusType statusType, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("statusType", statusType);
            return "statustypes/update";
        }
        statusType.merge();
        return "redirect:/statustypes/" + encodeUrlPathSegment(statusType.getId().toString(), request);
    }

	@RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("statusType", StatusType.findStatusType(id));
        return "statustypes/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        StatusType.findStatusType(id).remove();
        model.addAttribute("page", (page == null) ? "1" : page.toString());
        model.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/statustypes?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }

	@RequestMapping(params = { "find=ByName", "form" }, method = RequestMethod.GET)
    public String findStatusTypesByNameForm(Model model) {
        return "statustypes/findStatusTypesByName";
    }

	@RequestMapping(params = "find=ByName", method = RequestMethod.GET)
    public String findStatusTypesByName(@RequestParam("name") String name, Model model) {
        model.addAttribute("statustypes", StatusType.findStatusTypesByName(name).getResultList());
        return "statustypes/list";
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
        conversionService.addConverter(getStatusTypeConverter());
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
