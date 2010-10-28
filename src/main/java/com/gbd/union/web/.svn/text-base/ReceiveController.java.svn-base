package com.gbd.union.web;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import com.gbd.union.domain.CPRole;
import com.gbd.union.domain.Channel;
import com.gbd.union.domain.City;
import com.gbd.union.domain.Company;
import com.gbd.union.domain.Message;
import com.gbd.union.domain.Param;
import com.gbd.union.domain.Province;
import com.gbd.union.domain.StatusType;
import com.gbd.union.reference.EventStatus;
import com.gbd.union.web.utils.IP138;

@RequestMapping("GetSrv")
public class ReceiveController {

	private Logger log=Logger.getLogger(this.getClass());
	public Message create(Long mobile, String command, String spcode,
			String linkid, String created, String province, String city,
			String messageType) {
		Company cp = null;
		Company sp = null;

		Message m = new Message();
		m.setMobile(mobile);
		m.setCommand(command);
		m.setSpcode(spcode);
		m.setLinkId(linkid);

		Date _created = new Date();

		if (created != null) {
			SimpleDateFormat f = new SimpleDateFormat();

			try {
				_created = f.parse(created);
			} catch (ParseException e) {
			}
		}

		m.setCreated(_created);
		m.setSynStatus(EventStatus.DEFAULT);
		m.setSynTimes(0/* synTimes */);
		m.setSyned(new Date());

		//在这里处理扣量的
		Boolean isEnable = false;

		m.setIsEnable(isEnable);

		StatusType _messageType = null;
		if (messageType != null) {
			_messageType = (StatusType) StatusType.findStatusTypesByName(messageType);
		}

		m.setStatus(_messageType);

		
		
		Province _province = null;
		
		if(province!=null)
		{
			//直接用like的方式查找province
			_province=(Province)Province.findProvincesByNameLike(province);
		}
		
		City _city = null;

		if(city!=null)
		{
			//直接用like的方式查找city
			_city=(City)City.findCitysByNameLikeAndProvince(city,_province);
		}
		//如果_province或者_city为空，则到ip138.com根据手机号码查找，得到结果之后更新省份库和城市库
		if(_province==null || _city ==null)
		{
			String[] ip138=IP138.getProvinceAndCity(mobile.toString());
			if(ip138.length==2)
			{
				Province p=new Province();
				p.setName(ip138[0]);
				p.persist();
				_province=p;
				City c=new City();
				c.setName(ip138[1]);
				c.setProvince(p);
				c.persist();
				_city=c;
			}else
			{
				log.warn(String.format("IP138 is down and Mobile(%s) dost have province and City",mobile));
			}
		}
		
		m.setProvince(_province);
		m.setCity(_city);

		Channel c = (Channel) Channel.findChannelsBySpcode(spcode);

		if (c != null) {
			sp = c.getCompany();
			CPRole cpr = (CPRole) CPRole.findCPRolesByChannel(c);
			cp = cpr.getCp();
		}

		if (sp == null) {
			sp = new Company();
			sp.setId(0);
		}

		m.setSp(sp);

		if (cp == null) {
			cp = new Company();
			cp.setId(0);
		}
		m.setCp(cp);

		return m;
	}

	@RequestMapping(method = RequestMethod.GET)
	public String create(HttpServletRequest request) {

		String sid = request.getParameter("sid");
		if (sid == null)
			return null;

		Param p = Param.findParam(Integer.valueOf(sid));

		String mobile = request.getParameter(p.getMobileParam());
		String command = request.getParameter(p.getCommandParam());
		String spcode = request.getParameter(p.getSpcodeParam());
		String linkid = request.getParameter(p.getLinkIdParam());
		String created = request.getParameter(p.getCreatedParam());
		String province = request.getParameter(p.getProvinceParam());
		String city = request.getParameter(p.getCityParam());
		String messageType = request.getParameter(p.getStatusParam());

		Message message = create(Long.valueOf(mobile), command, spcode, linkid,
				created, province, city, messageType);

		message.persist();
		return "redirect:/messages/"
				+ encodeUrlPathSegment(message.getId().toString(), request);
	}

	private String encodeUrlPathSegment(String pathSegment,
			HttpServletRequest request) {
		String enc = request.getCharacterEncoding();
		if (enc == null) {
			enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
		}
		try {
			pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
		} catch (UnsupportedEncodingException uee) {
		}
		return pathSegment;
	}
}
