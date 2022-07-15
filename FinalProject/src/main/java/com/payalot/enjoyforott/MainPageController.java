package com.payalot.enjoyforott;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainPageController {
	@RequestMapping(value="start")
	public String startPage() {
		return "common/menubar";
	}
	
	@RequestMapping(value="startRedirect")
	public String goToStartPage() {
		return "redirect:start";
	}
	
}
