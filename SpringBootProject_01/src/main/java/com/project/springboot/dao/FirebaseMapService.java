package com.project.springboot.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.CollectionReference;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.FirestoreOptions;
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
		
		double lowerX = centerX-radius;
		double lowerY = centerY-radius;
		double upperX = centerX+radius;
		double upperY = centerY+radius;
		 
		ApiFuture<QuerySnapshot> query = firestore.collection(COL_REST)
													.whereGreaterThanOrEqualTo("x_wgs84", String.valueOf(lowerX))
													.whereGreaterThanOrEqualTo("y_wgs84", String.valueOf(lowerY))
													.whereLessThanOrEqualTo("x_wgs84", String.valueOf(upperX))
													.whereLessThanOrEqualTo("y_wgs84", String.valueOf(upperY))
													.limit(10)
													.get();
		List<QueryDocumentSnapshot> info = query.get().getDocuments();
		for (QueryDocumentSnapshot document : info) {
			RestMap restroom = document.toObject(RestMap.class);
			restrooms.add(restroom);
		}
		
		return restrooms;
		
	}
	
	public List<EleMap> getNearbyElevators(double centerX, double centerY, double radius) throws InterruptedException, ExecutionException {
		List<EleMap> elevators = new ArrayList<>();
		double lowerX = centerX-radius;
		double lowerY = centerY-radius;
		double upperX = centerX+radius;
		double upperY = centerY+radius;
		 
		
		
		ApiFuture<QuerySnapshot> query = firestore.collection(COL_ELE)
													.limit(10)
													.get();
		List<QueryDocumentSnapshot> info = query.get().getDocuments();
		for (QueryDocumentSnapshot document : info) {
			EleMap elevator = document.toObject(EleMap.class);
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
            data.setName(document.getString("fname"));
            data.setType(document.getString("aname"));
            data.setUpdatedate(document.getString("updatedate"));
            data.setXCoord(document.getString("x_wgs84"));
            data.setYCoord(document.getString("y_wgs84"));
            dataList.add(data);
        }
        System.out.println("dataList : " + dataList);
        return dataList;
	}
	
	public void getRestroomCoordX(RestMap restMap) throws InterruptedException, ExecutionException {
		Firestore db = FirestoreOptions.getDefaultInstance().getService();
		CollectionReference users = db.collection(COL_REST);
		ApiFuture<QuerySnapshot> query = users.get();
		QuerySnapshot querySnapshot = query.get();
		List<QueryDocumentSnapshot> documents = querySnapshot.getDocuments();
		
		for (QueryDocumentSnapshot document : documents) {
			System.out.println("name : " + document.getId());
			System.out.println("xCoord : " + document.getString("x_wgs84"));
			System.out.println("yCoord : " + document.getString("y_wgs84"));
		}
		
	}
	

	private double[] extractCoordinates(String pointString) {
	    String regex = "-?\\d+(\\.\\d+)?";
	    Pattern pattern = Pattern.compile(regex);
	    Matcher matcher = pattern.matcher(pointString);
	
	    double[] coordinates = new double[2];
	    int count = 0;
	    while (matcher.find() && count < 2) {
	        coordinates[count++] = Double.parseDouble(matcher.group());
	    }
	    return coordinates;
	}

}
