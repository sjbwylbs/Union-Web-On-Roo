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
import com.gbd.union.domain.Contact;
import com.gbd.union.domain.ContactType;
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

@RooWebScaffold(path = "contacts", formBackingObject = Contact.class)
@RequestMapping("/contacts")
@Controller
public class ContactController {

	@Autowired
    private GenericConversionService conversionService;

	@RequestMapping(method = RequestMethod.POST)
    public String create(@Valid Contact contact, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("contact", contact);
            return "contacts/create";
        }
        contact.persist();
        return "redirect:/contacts/" + encodeUrlPathSegment(contact.getId().toString(), request);
    }

	@RequestMapping(params = "form", method = RequestMethod.GET)
    public String createForm(Model model) {
        model.addAttribute("contact", new Contact());
        List dependencies = new ArrayList();
        if (Company.countCompanys() == 0) {
            dependencies.add(new String[]{"company", "companys"});
        }
        if (ContactType.countContactTypes() == 0) {
            dependencies.add(new String[]{"contactType", "contacttypes"});
        }
        model.addAttribute("dependencies", dependencies);
        return "contacts/create";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String show(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("contact", Contact.findContact(id));
        model.addAttribute("itemId", id);
        return "contacts/show";
    }

	@RequestMapping(method = RequestMethod.GET)
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("contacts", Contact.findContactEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Contact.countContacts() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("contacts", Contact.findAllContacts());
        }
        return "contacts/list";
    }

	@RequestMapping(method = RequestMethod.PUT)
    public String update(@Valid Contact contact, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("contact", contact);
            return "contacts/update";
        }
        contact.merge();
        return "redirect:/contacts/" + encodeUrlPathSegment(contact.getId().toString(), request);
    }

	@RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("contact", Contact.findContact(id));
        return "contacts/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        Contact.findContact(id).remove();
        model.addAttribute("page", (page == null) ? "1" : page.toString());
        model.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/contacts?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }

	@ModelAttribute("companys")
    public Collection<Company> populateCompanys() {
        return Company.findAllCompanys();
    }

	@ModelAttribute("contacttypes")
    public Collection<ContactType> populateContactTypes() {
        return ContactType.findAllContactTypes();
    }

	Converter<Company, String> getCompanyConverter() {
        return new Converter<Company, String>() {
            public String convert(Company company) {
                return new StringBuilder().append(company.getName()).append(" ").append(company.getAddress()).append(" ").append(company.getBankUserName()).toString();
            }
        };
    }

	Converter<Contact, String> getContactConverter() {
        return new Converter<Contact, String>() {
            public String convert(Contact contact) {
                return new StringBuilder().append(contact.getName()).append(" ").append(contact.getMobile()).append(" ").append(contact.getQq()).toString();
            }
        };
    }

	Converter<ContactType, String> getContactTypeConverter() {
        return new Converter<ContactType, String>() {
            public String convert(ContactType contactType) {
                return new StringBuilder().append(contactType.getName()).toString();
            }
        };
    }

	@PostConstruct
    void registerConverters() {
        conversionService.addConverter(getCompanyConverter());
        conversionService.addConverter(getContactConverter());
        conversionService.addConverter(getContactTypeConverter());
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
