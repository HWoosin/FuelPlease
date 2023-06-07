package com.spring.fuelplease;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.fuelplease.util.FuelAvg;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Slf4j
public class HomeController {

	@Autowired
	private FuelAvg fg;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		String formattedDate = dateFormat.format(date);
//		model.addAttribute("serverTime", formattedDate );		
		String gas = fg.getGasAvg();
		String preGas = fg.getPreGasAvg();
		String dis = fg.getDisAvg();
		List<String> gasList = fg.getMinGasInfo();
		List<String> preGasList = fg.getMinPreGasInfo();
		List<String> disList = fg.getMinDisInfo();
		
		model.addAttribute("gas", gas);
		model.addAttribute("preGas", preGas);
		model.addAttribute("dis", dis);
		model.addAttribute("minGas", gasList);
		model.addAttribute("minPreGas", preGasList);
		model.addAttribute("minDis", disList);
		
		return "home";
	}
	
	/*
	 * @GetMapping(value = "/") public void flashInfo() { fg.getFuelAvg();
	 * 
	 * }
	 */

}
