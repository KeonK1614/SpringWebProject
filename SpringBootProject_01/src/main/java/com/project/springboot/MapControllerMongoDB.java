package com.project.springboot;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.project.springboot.dao.MapServiceMongoDB;
import com.project.springboot.dto.EleMap2;
import com.project.springboot.dto.RestMap2;

@Controller
public class MapControllerMongoDB {
	@Autowired
	public MapServiceMongoDB mapService;
	
	@RequestMapping("/guest/restMap")
	public String getNearbyRestData(@RequestParam(value="centerX", required=false) Double centerX,
			@RequestParam(value="centerY", required=false) Double centerY,
			@RequestParam(value="radius", defaultValue = ".03") double radius, Model model) {
		
		System.out.println(centerX);
		System.out.println(centerY);
		if (centerX == null||centerY==null) {

			centerX = 127.0016;
			centerY = 37.5642;
		}
		try {
			List<RestMap2> restDataList = mapService.getNearbyRestData(centerX, centerY, radius);
			System.out.println("restDataList: " + restDataList);
			// optime 필드만 URL 인코딩 처리
			for (RestMap2 item : restDataList) {
				item.setOptime(encodeString(item.getOptime())); 
				System.out.println(item);
				model.addAttribute("restDataList", restDataList);
			}
		} catch (Exception e) {
			e.printStackTrace();		
		}
		return "guest/restMap";
	}
//	@RequestMapping("guest/restMap")
//	public String restMap()
//	{
//		return "guest/restMap";
//	}
	
	@RestController
	public @ResponseBody class getNearbyRestData2 {

	    @RequestMapping(value = "/guest/restMap4", method = RequestMethod.POST)
	    public List<RestMap2> getNearbyRestData(
	            @RequestParam(value="centerX", required=false) Double centerX,
	            @RequestParam(value="centerY", required=false) Double centerY,
	            @RequestParam(value="radius", defaultValue = "0.03") double radius) {
	        
	        System.out.println(centerX);
	        System.out.println(centerY);

	        if (centerX == null || centerY == null) {
	            centerX = 127.0016;
	            centerY = 37.5642;
	        }

	        try {
	            List<RestMap2> restDataList = mapService.getNearbyRestData(centerX, centerY, radius);
	            System.out.println("restDataList: " + restDataList);

	            // optime 필드만 URL 인코딩 처리
	            for (RestMap2 item : restDataList) {
	                item.setOptime(encodeString(item.getOptime())); 
	            }
	            return restDataList;  // JSON 형식으로 반환
	        } catch (Exception e) {
	            e.printStackTrace();
	            return new ArrayList<>();  // 오류 발생 시 빈 배열 반환
	        }
	    }
	}
	
	@RequestMapping("/guest/eleMap")
	public String getNearbyEleData(@RequestParam(value="centerX", required=false) Double centerX,
								@RequestParam(value="centerY", required=false) Double centerY,
								@RequestParam(value="radius", defaultValue = ".03") double radius, Model model) {
		if (centerX == null||centerY==null) {
			centerX = 127.0016;
			centerY = 37.5642;
		}
		try {
			 List<EleMap2> eleDataList = mapService.getNearbyEleData(centerX, centerY, radius);
			 model.addAttribute("eleDataList", eleDataList);
		} catch (Exception e) {
			e.printStackTrace();		
		}
		
		return "guest/eleMap";
	}
	
	private String encodeString(String value) {
        try {
            return URLEncoder.encode(value, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return value;
        }
    }
}
