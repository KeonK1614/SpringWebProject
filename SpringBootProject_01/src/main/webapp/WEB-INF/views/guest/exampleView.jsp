<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>Firestore Data</h1>     

        <c:forEach var="item1" items="${restDataList}">
    		<li>${item1.fname} - ${item1.x_wgs84}, ${item1.y_wgs84}</li>
		</c:forEach>
<%-- 		<c:forEach var="item2" items="${eleDataList }">
    		<li>${item2.sbwy_stn_name} - ${item2.x_wgs84}, ${item2.y_wgs84}</li>
		</c:forEach> --%>
   
</body>
</html>