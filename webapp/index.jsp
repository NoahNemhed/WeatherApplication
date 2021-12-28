<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HOME</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	

	
	<section class="section1">
	
	     <%	
	     try{
		     if(request.getSession().getAttribute("Allow-cookies") != null){

	    	 
		     } if(request.getSession().getValue("Allow-cookies").equals("true")){
	    		
	    			
	    			Cookie[] cookies = request.getCookies();
	    			
	    			if(cookies.length != 0){

	    				ArrayList<Cookie> ar = new ArrayList();

	    				for(Cookie c : cookies){
	    					if(c.getName().equals("cityStr")){	
	    						ar.add(c);
	    					}
	    				}
	    				for(Cookie c : cookies){
	    					 if(c.getName().equals("countryStr")){
	    						 ar.add(c);
	    					 }
	    					 
	    				}
	    				
	    				
	    				response.sendRedirect("http://localhost:8080/WeatherApp/weatherServlet?city=" + ar.get(0).getValue() + "&country=" + ar.get(1).getValue() + "&allow-cookies=on");

	    			
	    			}		
	    			
	    		}
	     }catch(NullPointerException e){}
 %>
	
	 
	<form action="weatherServlet">
	City : <input type="text" name="city" required>
	<br>
	 Country :<input type="text" name="country" placeholder="Format DE, SE, DK" required>
	<br>
	Allow cookies : <input type="checkbox" name="allow-cookies">
	<br>
	<input type="submit" value="Search">
	<div style="color:red">${errorMessage}</div>
	</form>
	</section>

	
	
	
</body>
</html>
