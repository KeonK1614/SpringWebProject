package com.project.springboot;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.springboot.dao.MapServiceMongoDB;
import com.project.springboot.dto.EleMap2;
import com.project.springboot.dto.RestMap2;

@Controller
public class MapControllerMongoDB {
	@Autowired
	public MapServiceMongoDB mapService;
	
	@RequestMapping("/guest/nearbyData3")
	public String getNearbyRestData(@RequestParam(value="centerX", required=false) Double centerX,
			@RequestParam(value="centerY", required=false) Double centerY,
			@RequestParam(value="radius", defaultValue = ".03") double radius, Model model) {
		if (centerX == null||centerY==null) {

			centerX = 127.0016;
			centerY = 37.5642;
		}
		try {
			List<RestMap2> restDataList = mapService.getNearbyRestData(centerX, centerY, radius);
			model.addAttribute("restDataList", restDataList);
		} catch (Exception e) {
			e.printStackTrace();		
		}
		
		return "guest/map2";
	}
	
	@RequestMapping("/guest/nearbyData4")
	public String getNearbyEleData(@RequestParam(value="centerX", required=false) Double centerX,
								@RequestParam(value="centerY", required=false) Double centerY,
								@RequestParam(value="radius", defaultValue = ".03") double radius, Model model) {
		if (centerX == null||centerY==null) {
			centerX = 127.0016;
			centerY = 37.5642;
		}
		try {
			 List<EleMap2> eleDataList = mapService.getNearbyEleData(centerX, centerY, radius);
			 System.out.println("eleDataList: " + eleDataList);
			 model.addAttribute("eleDataList", eleDataList);
		} catch (Exception e) {
			e.printStackTrace();		
		}
		
		return "guest/map2";
	}
}
