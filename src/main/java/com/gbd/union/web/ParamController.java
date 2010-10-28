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
import com.gbd.union.domain.Company;
import com.gbd.union.domain.Param;
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

@RooWebScaffold(path = "params", formBackingObject = Param.class)
@RequestMapping("/params")
@Controller
public class ParamController {

	@Autowired
    private GenericConversionService conversionService;

	@RequestMapping(method = RequestMethod.POST)
    public String create(@Valid Param param, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("param", param);
            return "params/create";
        }
        param.persist();
        return "redirect:/params/" + encodeUrlPathSegment(param.getId().toString(), request);
    }

	@RequestMapping(params = "form", method = RequestMethod.GET)
    public String createForm(Model model) {
        model.addAttribute("param", new Param());
        List dependencies = new ArrayList();
        if (Company.countCompanys() == 0) {
            dependencies.add(new String[]{"company", "companys"});
        }
        model.addAttribute("dependencies", dependencies);
        return "params/create";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String show(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("param", Param.findParam(id));
        model.addAttribute("itemId", id);
        return "params/show";
    }

	@RequestMapping(method = RequestMethod.GET)
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("params", Param.findParamEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Param.countParams() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("params", Param.findAllParams());
        }
        return "params/list";
    }

	@RequestMapping(method = RequestMethod.PUT)
    public String update(@Valid Param param, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("param", param);
            return "params/update";
        }
        param.merge();
        return "redirect:/params/" + encodeUrlPathSegment(param.getId().toString(), request);
    }

	@RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("param", Param.findParam(id));
        return "params/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        Param.findParam(id).remove();
        model.addAttribute("page", (page == null) ? "1" : page.toString());
        model.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/params?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }

	@ModelAttribute("companys")
    public Collection<Company> populateCompanys() {
        return Company.findAllCompanys();
    }

	Converter<Company, String> getCompanyConverter() {
        return new Converter<Company, String>() {
            public String convert(Company company) {
                return new StringBuilder().append(company.getName()).append(" ").append(company.getAddress()).append(" ").append(company.getBankUserName()).toString();
            }
        };
    }

	Converter<Param, String> getParamConverter() {
        return new Converter<Param, String>() {
            public String convert(Param param) {
                return new StringBuilder().append(param.getMobileParam()).append(" ").append(param.getCommandParam()).append(" ").append(param.getSpcodeParam()).toString();
            }
        };
    }

	@PostConstruct
    void registerConverters() {
        conversionService.addConverter(getCompanyConverter());
        conversionService.addConverter(getParamConverter());
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
