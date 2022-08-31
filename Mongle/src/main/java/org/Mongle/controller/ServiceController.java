package org.Mongle.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ServiceController {
	
	@RequestMapping(value = "/service/servicemain", method = RequestMethod.GET)
	public String list() {
		return  "service/servicemain";
	}
	
	@RequestMapping(value = "/service/faq", method = RequestMethod.GET)
	public String faq() {
		return  "service/faq";
	}
	
	@RequestMapping(value = "/service/questions", method = RequestMethod.GET)
	public String questions() {
		return  "service/questions";
	}
	
	@RequestMapping(value = "/service/order", method = RequestMethod.GET)
	public String order() {
		return  "service/order";
	}
	
	@RequestMapping(value = "/service/shipping", method = RequestMethod.GET)
	public String shipping() {
		return  "service/shipping";
	}
}
