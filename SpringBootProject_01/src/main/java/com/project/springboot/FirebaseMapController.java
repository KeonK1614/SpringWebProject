package com.project.springboot;

import java.util.List;
import java.util.concurrent.ExecutionException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.springboot.dao.FirebaseMapService;
import com.project.springboot.dto.EleMap;
import com.project.springboot.dto.RestMap;

@Controller
public class FirebaseMapController {
	@Autowired
	private FirebaseMapService firebaseMapService;
		
	@RequestMapping("/guest/map5")
	public String getNearbyRestData(@RequestParam(value="centerX", required=false) Double centerX,
			@RequestParam(value="centerY", required=false) Double centerY,
			@RequestParam(value="radius", defaultValue = ".02") double radius, Model model) {
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
		
		return "guest/map5";
	}
	
	@RequestMapping("/guest/nearbyData2")
	public String getNearbyEleData(@RequestParam(value="centerX", required=false) Double centerX,
								@RequestParam(value="centerY", required=false) Double centerY,
								@RequestParam(value="radius", defaultValue = ".02") double radius, Model model) {
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
	
//	@GetMapping("/admin/insertRestInfo")
//	public String insertRestInfo(@RequestParam RestMap restMap) throws InterruptedException, ExecutionException {
//		return firebaseMapService.insertRestMap(restMap);
//	}
//	
//	@GetMapping("/admin/updateRestInfo")
//	public String updateRestInfo(@RequestParam RestMap restMap) throws InterruptedException, ExecutionException {
//		return firebaseMapService.updateRestMap(restMap);
//	}
//	
//	@GetMapping("/admin/deleteRestInfo")
//	public String deleteRestInfo(@RequestParam String pname) throws InterruptedException, ExecutionException {
//		return firebaseMapService.deleteRestMap(pname);
//	}
//
//	@GetMapping("/admin/insertRestInfo")
//	public String insertEleInfo(@RequestParam EleMap eleMap) throws InterruptedException, ExecutionException {
//		return firebaseMapService.insertEleMap(eleMap);
//	}
//	
//	@GetMapping("/admin/updateRestInfo")
//	public String updateEleInfo(@RequestParam EleMap eleMap) throws InterruptedException, ExecutionException {
//		return firebaseMapService.updateEleMap(eleMap);
//	}
//	
//	@GetMapping("/admin/deleteRestInfo")
//	public String deleteEleInfo(@RequestParam String sbwy_stn_nm) throws InterruptedException, ExecutionException {
//		return firebaseMapService.deleteEleMap(sbwy_stn_nm);
//	}
//	

}
