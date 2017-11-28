package com.optimalroute.app.controllers;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.optimalroute.app.interfaces.IAccountService;
import com.optimalroute.app.objects.Account;

@Controller
public class LoginController {

	@Autowired
	private IAccountService accountService;

	@RequestMapping(value = { "/login", "/" }, method = RequestMethod.GET)
	public String login(Locale locale, Model model) {

		return "login";
	}

	@RequestMapping(value = { "/login", "/" }, method = RequestMethod.POST)
	public String login(@ModelAttribute("account") Account account) {

		for (Account acc : accountService.findAllAccount()) {
			if (acc.getLogin().equals(account.getLogin()) && acc.getPassword().equals(account.getPassword())) {
				HomeController.setCurrentAccount(acc);
				return "redirect:/home";
			}
		}

		return "redirect:/login";
	}

}
