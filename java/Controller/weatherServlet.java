package Controller;

import java.io.FileNotFoundException;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.GettheWeather;
import Model.weatherBean;

/**
 * Servlet implementation class weatherServlet
 */
@WebServlet("/weatherServlet")
public class weatherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			if(request.getParameter("allow-cookies") != null) {
				String cityStr = request.getParameter("city");
				String countryStr = request.getParameter("country");
				
				
				
				weatherBean wBean = new weatherBean(cityStr, countryStr);

				GettheWeather.getWeather(wBean);
				
				request.setAttribute("wBean", wBean);
				
				Cookie cookie = new Cookie("cityStr", cityStr);
				Cookie cookie2 = new Cookie("countryStr", countryStr);
				response.addCookie(cookie);
				response.addCookie(cookie2);
				
				HttpSession session = request.getSession();
				session.setAttribute("Allow-cookies", "true");	
				
				

				RequestDispatcher rd = request.getRequestDispatcher("ShowWeather.jsp");
				rd.forward(request, response);
			}else {
				HttpSession session = request.getSession();
				session.setAttribute("Allow-cookies", "false");	
				String cityStr = request.getParameter("city");
				String countryStr = request.getParameter("country");
				
				
				
				weatherBean wBean = new weatherBean(cityStr, countryStr);

				GettheWeather.getWeather(wBean);	
				request.setAttribute("wBean", wBean);
				RequestDispatcher rd = request.getRequestDispatcher("ShowWeather.jsp");
				rd.forward(request, response);
			}
			
		}catch(FileNotFoundException e){
			request.setAttribute("errorMessage", "City or Country not found.");
			request.getRequestDispatcher("index.jsp").forward(request, response);
			
		}
	}



}
