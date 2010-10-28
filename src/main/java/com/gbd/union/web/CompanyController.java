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
import com.gbd.union.domain.Company;
import com.gbd.union.domain.Person;
import com.gbd.union.reference.CompanyType;
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

@RooWebScaffold(path = "companys", formBackingObject = Company.class)
@RequestMapping("/companys")
@Controller
public class CompanyController {

	@Autowired
    private GenericConversionService conversionService;

	@RequestMapping(method = RequestMethod.POST)
    public String create(@Valid Company company, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("company", company);
            return "companys/create";
        }
        company.persist();
        return "redirect:/companys/" + encodeUrlPathSegment(company.getId().toString(), request);
    }

	@RequestMapping(params = "form", method = RequestMethod.GET)
    public String createForm(Model model) {
        model.addAttribute("company", new Company());
        List dependencies = new ArrayList();
        if (Person.countPeople() == 0) {
            dependencies.add(new String[]{"person", "people"});
        }
        model.addAttribute("dependencies", dependencies);
        return "companys/create";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String show(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("company", Company.findCompany(id));
        model.addAttribute("itemId", id);
        return "companys/show";
    }

	@RequestMapping(method = RequestMethod.GET)
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("companys", Company.findCompanyEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Company.countCompanys() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("companys", Company.findAllCompanys());
        }
        return "companys/list";
    }

	@RequestMapping(method = RequestMethod.PUT)
    public String update(@Valid Company company, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("company", company);
            return "companys/update";
        }
        company.merge();
        return "redirect:/companys/" + encodeUrlPathSegment(company.getId().toString(), request);
    }

	@RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("company", Company.findCompany(id));
        return "companys/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        Company.findCompany(id).remove();
        model.addAttribute("page", (page == null) ? "1" : page.toString());
        model.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/companys?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }

	@ModelAttribute("people")
    public Collection<Person> populatePeople() {
        return Person.findAllPeople();
    }

	@ModelAttribute("companytypes")
    public Collection<CompanyType> populateCompanyTypes() {
        return Arrays.asList(CompanyType.class.getEnumConstants());
    }

	Converter<Company, String> getCompanyConverter() {
        return new Converter<Company, String>() {
            public String convert(Company company) {
                return new StringBuilder().append(company.getName()).append(" ").append(company.getAddress()).append(" ").append(company.getBankUserName()).toString();
            }
        };
    }

	Converter<Person, String> getPersonConverter() {
        return new Converter<Person, String>() {
            public String convert(Person person) {
                return new StringBuilder().append(person.getUsername()).append(" ").append(person.getPassword()).append(" ").append(person.getStatus()).toString();
            }
        };
    }

	@PostConstruct
    void registerConverters() {
        conversionService.addConverter(getCompanyConverter());
        conversionService.addConverter(getPersonConverter());
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
