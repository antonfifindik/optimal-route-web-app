package com.optimalroute.app.controllers;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.optimalroute.app.configs.SpringConfig;
import com.optimalroute.app.dao.MySqlOrderDao;
import com.optimalroute.app.objects.Order;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private static AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(SpringConfig.class);
	private static MySqlOrderDao mySqlOrderDao = (MySqlOrderDao) context.getBean("mySqlOrderDao");
	private static int idDelete;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		ArrayList<Order> ordersList = (ArrayList<Order>) mySqlOrderDao.findAllOrders();

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("ordersList", ordersList);

		return "home";
	}

}
