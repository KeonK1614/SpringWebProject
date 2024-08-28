package com.project.springboot.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.CollectionReference;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.QueryDocumentSnapshot;
import com.google.cloud.firestore.QuerySnapshot;
import com.project.springboot.dto.EleMap;
import com.project.springboot.dto.RestMap;

@Service
public class FirebaseMapService implements IFirebaseMapService {
	@Autowired
	private Firestore firestore;
	
	public static final String COL_REST = "restmap";
	public static final String COL_ELE = "elemap";
	
	
	public List<RestMap> getNearbyRestrooms(double centerX, double centerY, double radius) throws InterruptedException, ExecutionException {
		List<RestMap> restrooms = new ArrayList<>();
		//사각형으로 범위를 만듬
		double lowerX = centerX-radius;
		double lowerY = centerY-radius;
		double upperX = centerX+radius;
		double upperY = centerY+radius;
		
		 //범위 안에 10개의 결과를 보여줌
		ApiFuture<QuerySnapshot> query = firestore.collection(COL_REST)
													.whereGreaterThanOrEqualTo("x_wgs84", String.valueOf(lowerX))
													.whereGreaterThanOrEqualTo("y_wgs84", String.valueOf(lowerY))
													.whereLessThanOrEqualTo("x_wgs84", String.valueOf(upperX))
													.whereLessThanOrEqualTo("y_wgs84", String.valueOf(upperY))
													.limit(10)
													.get();
//		System.out.println("query1: " + query);
		//리스트에 10개 결과 정보를 집어넣고 앞에 만들었던 restroom 객체로 반환
		List<QueryDocumentSnapshot> info = query.get().getDocuments();
//		System.out.println("info1: " + info);
		for (QueryDocumentSnapshot document : info) {
			RestMap restroom = document.toObject(RestMap.class);
			restrooms.add(restroom);
		}
		
		return restrooms;
		
	}
	
	public List<EleMap> getNearbyElevators(double centerX, double centerY, double radius) throws InterruptedException, ExecutionException {
		System.out.println("getElevator method called");
		List<EleMap> elevators = new ArrayList<>();
		
		double lowerX = centerX-radius;
		double lowerY = centerY-radius;
		double upperX = centerX+radius;
		double upperY = centerY+radius;
		
		ApiFuture<QuerySnapshot> query2 = firestore.collection(COL_ELE)
																	.whereGreaterThanOrEqualTo("x_wgs84", lowerX)
																	.whereGreaterThanOrEqualTo("y_wgs84", lowerY)
																	.whereLessThanOrEqualTo("x_wgs84", upperX)
																	.whereLessThanOrEqualTo("y_wgs84", upperY)
																	.limit(10)
																	.get();
		System.out.println("query2: " + query2);
		List<QueryDocumentSnapshot> info2 = query2.get().getDocuments();
		System.out.println("info 2: " + info2);
		for (QueryDocumentSnapshot document2 : info2) {
			EleMap elevator = document2.toObject(EleMap.class);
			System.out.println("elevators: " + elevator);
			elevators.add(elevator);
		}
		
		return elevators;
	}

	
	//화장실 정보 전체 알려줌 
	@Override
	public List<RestMap> getRestroomInfo() throws InterruptedException, ExecutionException {
		
        List<RestMap> dataList = new ArrayList<>();
        CollectionReference collection = firestore.collection("restmap");
        ApiFuture<QuerySnapshot> querySnapshot = collection.get();

        for (QueryDocumentSnapshot document : querySnapshot.get().getDocuments()) {
        	RestMap data = new RestMap();
            data.setFname(document.getString("fname"));
            data.setAname(document.getString("aname"));
            data.setUpdatedate(document.getString("updatedate"));
            data.setX_wgs84(document.getString("x_wgs84"));
            data.setY_wgs84(document.getString("y_wgs84"));
            dataList.add(data);
        }
        System.out.println("dataList : " + dataList);
        return dataList;
	}
	
	public void getRestroomCoordX(RestMap restMap) throws InterruptedException, ExecutionException {
		CollectionReference users = firestore.collection(COL_REST);
		ApiFuture<QuerySnapshot> query = users.get();
		QuerySnapshot querySnapshot = query.get();
		List<QueryDocumentSnapshot> documents = querySnapshot.getDocuments();
		
		for (QueryDocumentSnapshot document : documents) {
			System.out.println("name : " + document.getId());
			System.out.println("xCoord : " + document.getString("x_wgs84"));
			System.out.println("yCoord : " + document.getString("y_wgs84"));
		}
		
	}
}
