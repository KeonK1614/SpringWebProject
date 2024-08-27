package com.project.springboot.dto;

import lombok.Data;

@Data
public class RestMap {
	private String type;//민개방, 공중,공공청사, 
	private String center_x1;
	private String center_y1;
	private String cname;
	private String name;//fname
	private String insertdate;
	private String poi_id;
	private String updatedate;
	private String xCoord;//x_wgs84
	private String yCoord;//y_wgs84
}
