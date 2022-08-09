package org.Mongle.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ServiceController {
		@RequestMapping(value = "/service/servicemain", method = RequestMethod.GET)
		//고객 센터
		public String servicemain() {
			return  "service/servicemain";
		}
	}
