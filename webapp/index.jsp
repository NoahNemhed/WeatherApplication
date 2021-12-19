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
		    	 if(request.getSession().getValue("Allow-cookies").equals("false")){
			    	 	out.print("");
			    	    Cookie[] list = request.getCookies();
			    	    if (list != null) {
			    	        for (int i = 0; i < list.length; i++) {
			    	            list[i].setMaxAge(0);
			    	        }
			    	    }
		    	 }
	    	 
		     } if(request.getSession().getValue("Allow-cookies").equals("true")){
	    		
	    			
	    			Cookie[] cookies = request.getCookies();
	    			if(cookies.length != 0){
	    				out.print("Recent search : ");
	    				Cities : 
	    				for(Cookie c : cookies){
	    					if(c.getName().equals("cityStr")){
	    						out.print(c.getValue());

	    					}
	    				}
	    				out.print(" ");
	    				Countries : for(Cookie c : cookies){
	    					 if(c.getName().equals("countryStr")){
	    						 out.print(c.getValue());
	    					 }
	    				}
	    			}		
	    			
	    		}
	     }catch(NullPointerException e){}
 %>
	
	 
	<form action="weatherServlet">
	City : <input type="text" name="city" required>
	<br>
	Country : <input type="text" name="country" placeholder="Format DE, SE, DK" required>
	<br>
	Allow cookies : <input type="checkbox" name="allow-cookies">
	<br>
	<input type="submit" value="Search">
	<div style="color:red">${errorMessage}</div>
	</form>
	</section>

	
	
	
</body>
</html>