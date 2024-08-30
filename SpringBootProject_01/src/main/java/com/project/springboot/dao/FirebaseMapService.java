package com.project.springboot.dao;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.concurrent.ExecutionException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.QueryDocumentSnapshot;
import com.google.cloud.firestore.QuerySnapshot;
import com.google.firebase.cloud.FirestoreClient;
import com.google.firestore.v1.WriteResult;
import com.project.springboot.dto.EleMap;
import com.project.springboot.dto.RestMap;

@Service
public class FirebaseMapService implements IFirebaseMapService {
	@Autowired
	private Firestore firestore;
//	private final Firestore db = FirestoreClient.getFirestore();
	
	public static final String COL_REST = "restmap";
	public static final String COL_ELE = "elemap";
	
	
	public List<RestMap> getNearbyRestrooms(double centerX, double centerY, double radius) throws InterruptedException, ExecutionException {
		List<RestMap> restrooms = new ArrayList<>();
	    
		double lowerX = centerX - radius;
	    double lowerY = centerY - radius;
	    double upperX = centerX + radius;
	    double upperY = centerY + radius;
		//범위 안의 결과를 보여줌
		ApiFuture<QuerySnapshot> query = firestore.collection(COL_REST)
				.whereGreaterThanOrEqualTo("x_wgs84", lowerX)
				.whereGreaterThanOrEqualTo("y_wgs84", lowerY)
				.whereLessThanOrEqualTo("x_wgs84", upperX)
				.whereLessThanOrEqualTo("y_wgs84", upperY)
				.get();
//		System.out.println("query1: " + query);
		List<QueryDocumentSnapshot> info = query.get().getDocuments();
//		System.out.println("info1: " + info);
		for (QueryDocumentSnapshot document : info) {
			RestMap restroom = document.toObject(RestMap.class);
	        double x = restroom.getX_wgs84();
	        double y = restroom.getY_wgs84();

	        double distance = haversine(centerX, centerY, x, y);
	        
	        restroom.setDistance(distance);
	        restrooms.add(restroom);
		}
		
	    restrooms.sort(Comparator.comparingDouble(RestMap::getDistance));
		
		return restrooms.subList(0, Math.min(10, restrooms.size()));
		
	}
	
	public List<EleMap> getNearbyElevators(double centerX, double centerY, double radius) throws InterruptedException, ExecutionException {
		List<EleMap> elevators = new ArrayList<>();
	    
		double lowerX = centerX - radius;
	    double lowerY = centerY - radius;
	    double upperX = centerX + radius;
	    double upperY = centerY + radius;
		//범위 안의 결과를 보여줌
		ApiFuture<QuerySnapshot> query = firestore.collection(COL_ELE)
				.whereGreaterThanOrEqualTo("x_wgs84", lowerX)
				.whereGreaterThanOrEqualTo("y_wgs84", lowerY)
				.whereLessThanOrEqualTo("x_wgs84", upperX)
				.whereLessThanOrEqualTo("y_wgs84", upperY)
				.get();
//		System.out.println("query1: " + query);
		List<QueryDocumentSnapshot> info = query.get().getDocuments();
//		System.out.println("info1: " + info);
		for (QueryDocumentSnapshot document : info) {
			EleMap elevator = document.toObject(EleMap.class);
	        double x = elevator.getX_wgs84();
	        double y = elevator.getY_wgs84();

	        double distance = haversine(centerX, centerY, x, y);
	        
	        elevator.setDistance(distance);
	        elevators.add(elevator);
		}
		
		elevators.sort(Comparator.comparingDouble(EleMap::getDistance));
		
		return elevators.subList(0, Math.min(10, elevators.size()));
		
	}
	
	private double haversine(double lat1, double lon1, double lat2, double lon2) {
	    final int R = 6371; // 지구 반지름 (km)
	    double latDistance = Math.toRadians(lat2 - lat1);
	    double lonDistance = Math.toRadians(lon2 - lon1);
	    double a = Math.sin(latDistance / 2) * Math.sin(latDistance / 2)
	            + Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2))
	            + Math.sin(lonDistance / 2) * Math.sin(lonDistance / 2);
	    double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
	    return R * c;
	}

//	@Override
//	public String insertRestMap(RestMap restMap) throws InterruptedException, ExecutionException {
//	
//		ApiFuture<com.google.cloud.firestore.WriteResult> apiFuture = db.collection(COL_REST).document(restMap.getPname()).set(restMap);
//		
//		return apiFuture.get().getUpdateTime().toString();
//	}
//
//	@Override
//	public String updateRestMap(RestMap restMap) throws InterruptedException, ExecutionException {
//		ApiFuture<com.google.cloud.firestore.WriteResult> apiFuture = db.collection(COL_REST).document(restMap.getPname()).set(restMap);
//		
//		return apiFuture.get().getUpdateTime().toString();
//	}
//
//	@Override
//	public String deleteRestMap(String pname) {
//		ApiFuture<com.google.cloud.firestore.WriteResult> apiFuture = db.collection(COL_REST).document(pname).delete();
//		return "Document id: " + pname + " deleted.";
//	}
//
//	@Override
//	public String insertEleMap(EleMap eleMap) throws InterruptedException, ExecutionException {
//		ApiFuture<com.google.cloud.firestore.WriteResult> apiFuture = db.collection(COL_ELE).document(eleMap.getSbwy_stn_nm()).set(eleMap);
//		
//		return apiFuture.get().getUpdateTime().toString();
//	}
//
//	@Override
//	public String updateEleMap(EleMap eleMap) throws InterruptedException, ExecutionException {
//		ApiFuture<com.google.cloud.firestore.WriteResult> apiFuture = db.collection(COL_ELE).document(eleMap.getSbwy_stn_nm()).set(eleMap);
//		
//		return apiFuture.get().getUpdateTime().toString();
//	}
//
//	@Override
//	public String deleteEleMap(String sbwy_stn_nm) {
//		ApiFuture<com.google.cloud.firestore.WriteResult> apiFuture = db.collection(COL_ELE).document(sbwy_stn_nm).delete();
//		return "Document id: " + sbwy_stn_nm + " deleted.";
//	}


}
