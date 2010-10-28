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
import com.gbd.union.domain.City;
import com.gbd.union.domain.MobileCity;
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

@RooWebScaffold(path = "mobilecitys", formBackingObject = MobileCity.class)
@RequestMapping("/mobilecitys")
@Controller
public class MobileCityController {

	@Autowired
    private GenericConversionService conversionService;

	@RequestMapping(method = RequestMethod.POST)
    public String create(@Valid MobileCity mobileCity, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("mobileCity", mobileCity);
            return "mobilecitys/create";
        }
        mobileCity.persist();
        return "redirect:/mobilecitys/" + encodeUrlPathSegment(mobileCity.getId().toString(), request);
    }

	@RequestMapping(params = "form", method = RequestMethod.GET)
    public String createForm(Model model) {
        model.addAttribute("mobileCity", new MobileCity());
        List dependencies = new ArrayList();
        if (City.countCitys() == 0) {
            dependencies.add(new String[]{"city", "citys"});
        }
        model.addAttribute("dependencies", dependencies);
        return "mobilecitys/create";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String show(@PathVariable("id") Long id, Model model) {
        model.addAttribute("mobilecity", MobileCity.findMobileCity(id));
        model.addAttribute("itemId", id);
        return "mobilecitys/show";
    }

	@RequestMapping(method = RequestMethod.GET)
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("mobilecitys", MobileCity.findMobileCityEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) MobileCity.countMobileCitys() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("mobilecitys", MobileCity.findAllMobileCitys());
        }
        return "mobilecitys/list";
    }

	@RequestMapping(method = RequestMethod.PUT)
    public String update(@Valid MobileCity mobileCity, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("mobileCity", mobileCity);
            return "mobilecitys/update";
        }
        mobileCity.merge();
        return "redirect:/mobilecitys/" + encodeUrlPathSegment(mobileCity.getId().toString(), request);
    }

	@RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Long id, Model model) {
        model.addAttribute("mobileCity", MobileCity.findMobileCity(id));
        return "mobilecitys/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        MobileCity.findMobileCity(id).remove();
        model.addAttribute("page", (page == null) ? "1" : page.toString());
        model.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/mobilecitys?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }

	@ModelAttribute("citys")
    public Collection<City> populateCitys() {
        return City.findAllCitys();
    }

	Converter<City, String> getCityConverter() {
        return new Converter<City, String>() {
            public String convert(City city) {
                return new StringBuilder().append(city.getName()).append(" ").append(city.getZIP()).toString();
            }
        };
    }

	Converter<MobileCity, String> getMobileCityConverter() {
        return new Converter<MobileCity, String>() {
            public String convert(MobileCity mobileCity) {
                return new StringBuilder().append(mobileCity.getMobilePrefix()).toString();
            }
        };
    }

	@PostConstruct
    void registerConverters() {
        conversionService.addConverter(getCityConverter());
        conversionService.addConverter(getMobileCityConverter());
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
