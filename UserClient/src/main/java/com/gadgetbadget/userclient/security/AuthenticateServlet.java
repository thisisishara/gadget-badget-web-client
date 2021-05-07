package com.gadgetbadget.userclient.security;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

/**
 * Servlet implementation class Authenticate
 */
@WebServlet("/Authenticate")
public class AuthenticateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserServiceComm userServiceComm;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuthenticateServlet() {
        super();
        userServiceComm = new UserServiceComm();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		//creating payload to send the user service
		JsonObject payload = new JsonObject();
		payload.addProperty("username", username);
		payload.addProperty("password", password);
		//getting the response
		JsonObject serviceResponseJSON = userServiceComm.authenticate(payload);
		//test the output
		System.out.println(serviceResponseJSON.toString());
		
		//Inspect the response and add cookies
		if (serviceResponseJSON.has("JWT Auth Token")) {
			Cookie authCookie = new Cookie("auth", serviceResponseJSON.get("JWT Auth Token").getAsString());
			authCookie.setMaxAge(600);
	    	response.addCookie(authCookie);
		}
		response.getWriter().append(serviceResponseJSON.toString());
	}

}
