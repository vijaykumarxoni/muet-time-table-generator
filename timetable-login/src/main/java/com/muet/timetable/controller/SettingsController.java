package com.muet.timetable.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/settings")
public class SettingsController {

	
	@RequestMapping("")
	public String DayPage(Model modele) {
		return "settings-page";
	}
}
