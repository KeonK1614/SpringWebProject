package com.project.springboot;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.springboot.dao.FirebaseMapService;
import com.project.springboot.dto.RestMap;

@Controller
public class FirebaseMapController {
	@Autowired
	private FirebaseMapService firebaseMapService;
	
	@RequestMapping("/guest/nearbyData")
	public String getNearbyData(@RequestParam double centerX, @RequestParam double centerY, @RequestParam(defaultValue = ".01") double radius, Model model) {
		try {
			 List<RestMap> dataList = firebaseMapService.getNearbyRestrooms(centerX, centerY, radius);
			 model.addAttribute("dataList", dataList);
		} catch (Exception e) {
			e.printStackTrace();		
		}
		
		return "guest/exampleView";
	}
	
	@RequestMapping("/guest/data2")
	public String getData(Model model) {
		try {
			List<RestMap> dataList = firebaseMapService.getRestroomInfo();
			model.addAttribute("dataList", dataList);
			System.out.println("dataList2: " + dataList);
		} catch (Exception e) {
			e.printStackTrace();	
		}
		return "guest/exampleView";
	}
}
