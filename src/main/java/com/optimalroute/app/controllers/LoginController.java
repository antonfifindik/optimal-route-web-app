package com.optimalroute.app.controllers;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.optimalroute.app.objects.Account;

@Controller
public class LoginController {

	@RequestMapping(value = { "/login", "/" }, method = RequestMethod.GET)
	public String login(Locale locale, Model model) {

		return "login";
	}

	@RequestMapping(value = { "/login", "/" }, method = RequestMethod.POST)
	public String login(@ModelAttribute("account") Account account) {

		System.err.println(account.getLogin() + " " + account.getPassword());
		if (account.getLogin().equals("courier1") && account.getPassword().equals("rootroot")) {
			HomeController.account = account.getLogin();
			return "redirect:/home";
		}

		return "redirect:/login";
	}

}
