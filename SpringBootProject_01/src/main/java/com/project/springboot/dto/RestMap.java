package com.project.springboot.dto;

import lombok.Data;

@Data
public class RestMap {
	private String aname;// 종류 - 민간개방, 공중,공공청사, etc
	private String center_x1;
	private String center_y1;
	private String cname;//뭔지 모르겠음 아마 생략 가능?
	private String fname;//장소명
	private String insertdate;
	private String poi_id;
	private String updatedate;
	private String x_wgs84;//x_wgs84 좌표 경도
	private String y_wgs84;//y_wgs84 좌표 위도
}
