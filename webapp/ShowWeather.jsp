<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="Model.weatherBean"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>The Weather</title>
<link rel="stylesheet" href="style.css">
</head>
<body>

	

	<section class="section1">
	
				<%
				weatherBean wBean = (weatherBean) request.getAttribute("wBean");
				out.print("Country - " + wBean.getCountryStr() + "<br>" + "City - " + wBean.getCityStr());
				out.print("<br>");
				out.print("Last updated -  " + wBean.getLastUpdated());
				out.print("<br>");
				out.print("Weather Celcius - "+ Math.round((wBean.getWeatherDescription()  - 273.15)));
				out.print("<br>");
				out.print("Clouds -  "+ wBean.getCloudsStr());	

				
				
			
	
	%>
	
	</section>
	
	<section class="section1">
		<form action="weatherServlet">
		City : <input type="text" name="city" required>
		<br>
		 Country :<input type="text" name="country" placeholder="Format DE, SE, DK" required>
		<br>
		Allow cookies : <input type="checkbox" name="allow-cookies" checked="checked">
		<br>
		<input type="submit" value="Another Search">
		</form>
		
	</section>
	

	
	

		
	
		

	
	
</body>
</html>
