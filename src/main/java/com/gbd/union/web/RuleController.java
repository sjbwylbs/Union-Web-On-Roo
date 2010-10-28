package com.gbd.union.web;

import java.io.UnsupportedEncodingException;
import java.util.Collection;
import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.core.convert.support.GenericConversionService;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import com.gbd.union.domain.Person;
import com.gbd.union.domain.Res;
import com.gbd.union.domain.Rule;
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

@RooWebScaffold(path = "rules", formBackingObject = Rule.class)
@RequestMapping("/rules")
@Controller
public class RuleController {

	@Autowired
    private GenericConversionService conversionService;

	@RequestMapping(method = RequestMethod.POST)
    public String create(@Valid Rule rule, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("rule", rule);
            return "rules/create";
        }
        rule.persist();
        return "redirect:/rules/" + encodeUrlPathSegment(rule.getId().toString(), request);
    }

	@RequestMapping(params = "form", method = RequestMethod.GET)
    public String createForm(Model model) {
        model.addAttribute("rule", new Rule());
        return "rules/create";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String show(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("rule", Rule.findRule(id));
        model.addAttribute("itemId", id);
        return "rules/show";
    }

	@RequestMapping(method = RequestMethod.GET)
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("rules", Rule.findRuleEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Rule.countRules() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("rules", Rule.findAllRules());
        }
        return "rules/list";
    }

	@RequestMapping(method = RequestMethod.PUT)
    public String update(@Valid Rule rule, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("rule", rule);
            return "rules/update";
        }
        rule.merge();
        return "redirect:/rules/" + encodeUrlPathSegment(rule.getId().toString(), request);
    }

	@RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("rule", Rule.findRule(id));
        return "rules/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        Rule.findRule(id).remove();
        model.addAttribute("page", (page == null) ? "1" : page.toString());
        model.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/rules?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }

	@ModelAttribute("people")
    public Collection<Person> populatePeople() {
        return Person.findAllPeople();
    }

	@ModelAttribute("reses")
    public Collection<Res> populateReses() {
        return Res.findAllReses();
    }

	Converter<Person, String> getPersonConverter() {
        return new Converter<Person, String>() {
            public String convert(Person person) {
                return new StringBuilder().append(person.getUsername()).append(" ").append(person.getPassword()).append(" ").append(person.getStatus()).toString();
            }
        };
    }

	Converter<Res, String> getResConverter() {
        return new Converter<Res, String>() {
            public String convert(Res res) {
                return new StringBuilder().append(res.getName()).append(" ").append(res.getRes_type()).append(" ").append(res.getRes_string()).toString();
            }
        };
    }

	Converter<Rule, String> getRuleConverter() {
        return new Converter<Rule, String>() {
            public String convert(Rule rule) {
                return new StringBuilder().append(rule.getName()).append(" ").append(rule.getDescn()).toString();
            }
        };
    }

	@PostConstruct
    void registerConverters() {
        conversionService.addConverter(getPersonConverter());
        conversionService.addConverter(getResConverter());
        conversionService.addConverter(getRuleConverter());
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
