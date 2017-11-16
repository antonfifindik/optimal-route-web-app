package com.optimalroute.app.controllers;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.optimalroute.app.interfaces.IOrderService;

@Controller
public class CRUDAddressController {

	@Autowired
	private IOrderService orderService;

	@RequestMapping(value = "/addresses", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "home";
	}
}
