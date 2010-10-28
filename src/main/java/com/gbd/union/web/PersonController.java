package com.gbd.union.web;

import java.io.UnsupportedEncodingException;
import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.core.convert.support.GenericConversionService;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import com.gbd.union.domain.Person;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "people", formBackingObject = Person.class)
@RequestMapping("/people")
@Controller
public class PersonController {

	@Autowired
    private GenericConversionService conversionService;

	@RequestMapping(method = RequestMethod.POST)
    public String create(@Valid Person person, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("person", person);
            return "people/create";
        }
        person.persist();
        return "redirect:/people/" + encodeUrlPathSegment(person.getId().toString(), request);
    }

	@RequestMapping(params = "form", method = RequestMethod.GET)
    public String createForm(Model model) {
        model.addAttribute("person", new Person());
        return "people/create";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String show(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("person", Person.findPerson(id));
        model.addAttribute("itemId", id);
        return "people/show";
    }

	@RequestMapping(method = RequestMethod.GET)
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("people", Person.findPersonEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Person.countPeople() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("people", Person.findAllPeople());
        }
        return "people/list";
    }

	@RequestMapping(method = RequestMethod.PUT)
    public String update(@Valid Person person, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("person", person);
            return "people/update";
        }
        person.merge();
        return "redirect:/people/" + encodeUrlPathSegment(person.getId().toString(), request);
    }

	@RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("person", Person.findPerson(id));
        return "people/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        Person.findPerson(id).remove();
        model.addAttribute("page", (page == null) ? "1" : page.toString());
        model.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/people?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
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
