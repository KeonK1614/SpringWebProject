package com.project.springboot;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.springboot.dao.FirebaseMapService;
import com.project.springboot.dto.EleMap;
import com.project.springboot.dto.RestMap;

@Controller
public class FirebaseMapController {
	@Autowired
	private FirebaseMapService firebaseMapService;
	
	@RequestMapping("/guest/nearbyData")
	public String getNearbyRestData(@RequestParam(value="centerX", required=false) Double centerX,
								@RequestParam(value="centerY", required=false) Double centerY,
								@RequestParam(value="radius", defaultValue = ".01") double radius, Model model) {
		if (centerX == null||centerY==null) {
			centerX = 127.0016;
			centerY = 37.5642;
		}
		try {
			 List<RestMap> restDataList = firebaseMapService.getNearbyRestrooms(centerX, centerY, radius);
			 System.out.println("dataList: " + restDataList);
			 model.addAttribute("dataList", restDataList);
		} catch (Exception e) {
			e.printStackTrace();		
		}
		
		return "guest/exampleView";
	}
	
//	@RequestMapping("/guest/nearbyData2")
//	public String getNearbyEleData(@RequestParam(value="centerX", required=false) Double centerX,
//								@RequestParam(value="centerY", required=false) Double centerY,
//								@RequestParam(value="radius", defaultValue = ".01") double radius, Model model) {
//		if (centerX == null||centerY==null) {
//			centerX = 127.0016;
//			centerY = 37.5642;
//		}
//		try {
//			 List<EleMap> eleDataList = firebaseMapService.getNearbyElevators(centerX, centerY, radius);
//			 System.out.println("dataList: " + eleDataList);
//			 model.addAttribute("dataList", eleDataList);
//		} catch (Exception e) {
//			e.printStackTrace();		
//		}
//		
//		return "guest/exampleView";
//	}
//	
	

}
