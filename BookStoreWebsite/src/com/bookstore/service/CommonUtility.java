package com.bookstore.service;

import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

public class CommonUtility {
	public static void generateCountryList(HttpServletRequest request) {
		String[] countryCodes = Locale.getISOCountries();
		
		Map<String, String> mapCounties = new TreeMap<>();
		
		for (String countryCode : countryCodes) {
			Locale locale = new Locale("", countryCode);
			String code = locale.getCountry();
			String name = locale.getDisplayCountry();
			
			mapCounties.put(name, code);
			
		}
		
		request.setAttribute("mapCounties", mapCounties);
	}

}
