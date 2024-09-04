package com.project.springboot;

import java.util.List;
import java.util.concurrent.ExecutionException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
			@RequestParam(value="radius", defaultValue = ".03") double radius, Model model) {
		if (centerX == null||centerY==null) {

			centerX = 127.0016;
			centerY = 37.5642;
		}
		try {
			List<RestMap> restDataList = firebaseMapService.getNearbyRestrooms(centerX, centerY, radius);
			System.out.println("restDataList: " + restDataList);
			model.addAttribute("restDataList", restDataList);
		} catch (Exception e) {
			e.printStackTrace();		
		}
		
		return "guest/map2";
	}
	
	@RequestMapping("/guest/nearbyData2")
	public String getNearbyEleData(@RequestParam(value="centerX", required=false) Double centerX,
								@RequestParam(value="centerY", required=false) Double centerY,
								@RequestParam(value="radius", defaultValue = ".03") double radius, Model model) {
		if (centerX == null||centerY==null) {
			centerX = 127.0016;
			centerY = 37.5642;
		}
		try {
			 List<EleMap> eleDataList = firebaseMapService.getNearbyElevators(centerX, centerY, radius);
			 System.out.println("eleDataList: " + eleDataList);
			 model.addAttribute("eleDataList", eleDataList);
		} catch (Exception e) {
			e.printStackTrace();		
		}
		
		return "guest/map2";
	}
	
//	@GetMapping("/member/add")
//	public String showAddForm(Model model) {
//		try {
//			model.addAttribute("restMap", new RestMap());
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "/member/addRestroom";
//	}
//	
//	@PostMapping("/member/add")
//	public String addRestData(@ModelAttribute RestMap restmap) {
//		try {
//			firebaseMapService.addRestrooms(restmap);
//			System.out.println("add works");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "redirect:/member/list";
//	}
//	
//	@GetMapping("/member/edit/{id}")
//	public String showEditForm(@PathVariable String id, Model model) {
//		try {
//			RestMap restMap = firebaseMapService.getRestroomById(id);
//			model.addAttribute("restMap", restMap);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "member/editRestroom";
//	}
//	
//	@PostMapping("/member/edit/{id}")
//	public String updateRestData(@PathVariable String id, @ModelAttribute RestMap restmap) {
//		try {
//			firebaseMapService.updateRestrooms(id, restmap);
//		} catch (Exception e) {
//			e.printStackTrace();
//			return "error";
//		}
//		return "redirect:/member/list";
//	}
//	
//	@GetMapping("/member/delete/{id}")
//	public String deleteRestData(@PathVariable String id) {
//		try {
//			firebaseMapService.deleteRestrooms(id);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "redirect:/member/list";
//	}
//	
//
//	
//	@GetMapping("/member/list")
//	public String listRestData(Model model) {
//		try {
//			model.addAttribute("restrooms", firebaseMapService.getAllRestrooms());
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "/member/listRestroom";
//	}
	
}
