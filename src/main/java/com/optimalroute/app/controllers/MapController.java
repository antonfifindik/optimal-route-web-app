package com.optimalroute.app.controllers;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.optimalroute.app.interfaces.IAddressService;

@Controller
public class MapController {

	@Autowired
	private IAddressService addressService;

	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		model.addAttribute("account", HomeController.account);

		return "map";
	}

	@RequestMapping(value = "/getNewAddressFirst", method = RequestMethod.GET)
	public @ResponseBody String getFirstAddress() {
		return "VInnitsya, YunostI, 45";
	}

	@RequestMapping(value = "/getNewAddressAll", method = RequestMethod.GET)
	public @ResponseBody String[] getAllAddresses() {
		// List<Address> addresses = addressService.findAllAddresses();
		// String[] result = new String[addresses.size()];
		//
		// for (int i = 0; i < result.length; i++) {
		// result[i] = addresses.get(i).getCity() + ", " + addresses.get(i).getStreet()
		// + ", " + addresses.get(i).getHouseNumber();
		// }

		String[] result = { "Вінниця, Батозька, 21", "Вінниця, Юності, 55", "Вінниця, Соборна, 10", "Вінниця, Ігоря Костецького, 12", "Вінниця, Воїнів-Інтернаціоналістів, 3", "Вінниця, Келецька, 105", "Вінниця, Зодчих, 28", "Вінниця, Бучми, 126",
				"Вінниця, Блока, 3" };

		return result;
	}

	@RequestMapping(value = "/getNewAddressThird", method = RequestMethod.GET)
	public @ResponseBody String getThirdSecond() {
		return "Vinnytsia, vulytsia Aivazovskoho, 51";
	}

	@RequestMapping(value = "/getAddresses", method = RequestMethod.GET)
	public @ResponseBody String[] addAddressToMap() {

		return new String[] { "Vinnitsa, 600-letiya, 58", "Vinnitsa, 600-letiya, 58" };
	}

	@RequestMapping(value = "/getArrayAddresses", method = RequestMethod.GET)
	public @ResponseBody String[] getArrayAddresses() {

		return new String[] { "Vinnitsa, Lesi Ukrainky, 20", "Vinnitsa, Soborna, 20", "Vinnitsa, Lesi Ukrainky, 10" };
	}

	@RequestMapping(value = "/getTwoAddresses", method = RequestMethod.GET)
	public @ResponseBody String[] getTwoAddresses() {

		return new String[] { "Vinnitsa, 600-letiya, 1", "Vinnitsa, 600-letiya, 66", "Vinnytsia, vulytsia Aivazovskoho, 51" };
	}

}
