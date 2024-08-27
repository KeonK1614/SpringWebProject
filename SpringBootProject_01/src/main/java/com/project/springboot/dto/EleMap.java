package com.project.springboot.dto;

import lombok.Data;

@Data
public class EleMap {
	private String sName;//sbwy_stn_name 지하철명
	private String sCode;//sbwy_stn_cd 지하철 코드
	private String sggCd;//sgg_cd 시군구 코드
	private String emdName;//emd_nm 읍면동 이름
	private String coord;//node_wkt 위도 경도 코드
	private String entranceCode;//node_cd 노드 코드 0- 일반, 1-지하철 출입구, 2- 버스정류장, 3- 지하보도 출입구
	private String sggName;//sgg_nm 시군구이름

}
