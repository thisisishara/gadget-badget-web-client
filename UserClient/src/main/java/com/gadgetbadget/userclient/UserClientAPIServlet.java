package com.gadgetbadget.userclient;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gadgetbadget.userclient.security.UserServiceComm;
import com.gadgetbadget.userclient.util.JsonResponseBuilder;
import com.gadgetbadget.userclient.util.TaskType;
import com.gadgetbadget.userclient.util.UserType;
import com.google.gson.JsonObject;

@WebServlet("/UserClientAPI")
public class UserClientAPIServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserServiceComm userServiceComm;

	public UserClientAPIServlet() {
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
		try {
			String task = request.getParameter("formtask").toString().toUpperCase();
			String userType = request.getParameter("usertype").toString().toUpperCase();

			if(task.equalsIgnoreCase(TaskType.GET_USERS.toString())) {
				/*JsonObject jsonResponse = new JsonResponseBuilder().getJsonErrorResponse("Bad Request. Please try again.");
				response.getWriter().append(jsonResponse.toString());
				Cookie[] cookies = request.getCookies();
				if( cookies != null ) {
			         System.out.println("<h2> Found Cookies Name and Value</h2>");

			         for (int i = 0; i < cookies.length; i++) {
			            Cookie cookie = cookies[i];
			            System.out.print("Name : " + cookie.getName( ) + ",  ");
			            System.out.print("Value: " + cookie.getValue( ) + " <br/>");
			         }
			      } else {
			    	  System.out.println("<h2>No cookies founds</h2>");
			      }*/

			} else if(task.equalsIgnoreCase(TaskType.POST_USER.toString())) {
				if(userType.equalsIgnoreCase(UserType.CONSUMER.toString())) {
					//getting request parameters
					String username = request.getParameter("consumerusername");
					String password = request.getParameter("consumerpassword");
					String email = request.getParameter("consumeremail");
					String firstname = request.getParameter("consumerfirstname");
					String lastname = request.getParameter("consumerlastname");
					String gender = request.getParameter("consumergender");
					String phone = request.getParameter("consumerphone");
					
					//get 1-char value for gender
					String genderChar = getGender(gender); 
					
					//testing parameter values
					System.out.println("consumer post inputs: " + username +" "+ password +" "+ email +" "+ firstname +" "+ lastname +" "+ gender +" "+ genderChar +" "+ phone);
					
					//generating the PAYLOAD to send the user service
					JsonObject payload = new JsonObject();
					payload.addProperty("username", username);
					payload.addProperty("password", password);
					payload.addProperty("primary_email", email);
					payload.addProperty("first_name", firstname);
					payload.addProperty("last_name", lastname);
					payload.addProperty("gender", genderChar);
					payload.addProperty("primary_phone", phone);
					
					//getting the response
					JsonObject serviceResponseJSON = userServiceComm.postUser("users/consumers", payload);
					//test the response
					System.out.println(serviceResponseJSON.toString());
					
					response.getWriter().append(serviceResponseJSON.toString());
					
				} else if(userType.equalsIgnoreCase(UserType.FUNDER.toString())) {
					//getting request parameters
					String username = request.getParameter("funderusername");
					String password = request.getParameter("funderpassword");
					String email = request.getParameter("funderemail");
					String firstname = request.getParameter("funderfirstname");
					String lastname = request.getParameter("fundersecondname");
					String gender = request.getParameter("fundergender");
					String phone = request.getParameter("funderphone");
					String organization = request.getParameter("funderorg");
					
					//get 1-char value for gender
					String genderChar = getGender(gender); 
					
					//testing parameter values
					System.out.println("funder post inputs: " + username +" "+ password +" "+ email +" "+ firstname +" "+ lastname +" "+ gender +" "+ genderChar +" "+ phone +" "+ organization);
					
					//generating the PAYLOAD to send the user service
					JsonObject payload = new JsonObject();
					payload.addProperty("username", username);
					payload.addProperty("password", password);
					payload.addProperty("primary_email", email);
					payload.addProperty("first_name", firstname);
					payload.addProperty("last_name", lastname);
					payload.addProperty("gender", genderChar);
					payload.addProperty("primary_phone", phone);
					payload.addProperty("organization", organization);
					
					//getting the response
					JsonObject serviceResponseJSON = userServiceComm.postUser("users/funders", payload);
					//test the response
					System.out.println(serviceResponseJSON.toString());
					
					response.getWriter().append(serviceResponseJSON.toString());
				} else if(userType.equalsIgnoreCase(UserType.RESEARCHER.toString())) {
					//getting request parameters
					String username = request.getParameter("researcherusername");
					String password = request.getParameter("researcherpassword");
					String email = request.getParameter("researcheremail");
					String firstname = request.getParameter("researcherfirstname");
					String lastname = request.getParameter("researchersecondname");
					String gender = request.getParameter("researchergender");
					String phone = request.getParameter("researcherphone");
					String institution = request.getParameter("researcherinstitute");
					String fos = request.getParameter("researcherfos");
					String yoe = request.getParameter("researcheryoe");
					
					//get 1-char value for gender
					String genderChar = getGender(gender); 
					
					//testing parameter values
					System.out.println("consumer post inputs: " + username +" "+ password +" "+ email +" "+ firstname +" "+ lastname +" "+ gender +" "+ phone +" "+ institution +" "+ fos +" "+ yoe);
					
					//generating the PAYLOAD to send the user service
					JsonObject payload = new JsonObject();
					payload.addProperty("username", username);
					payload.addProperty("password", password);
					payload.addProperty("primary_email", email);
					payload.addProperty("first_name", firstname);
					payload.addProperty("last_name", lastname);
					payload.addProperty("gender", genderChar);
					payload.addProperty("primary_phone", phone);
					payload.addProperty("institution", institution);
					payload.addProperty("field_of_study", fos);
					payload.addProperty("years_of_exp", yoe);
					
					//getting the response
					JsonObject serviceResponseJSON = userServiceComm.postUser("users/researchers", payload);
					//test the response
					System.out.println(serviceResponseJSON.toString());
					
					response.getWriter().append(serviceResponseJSON.toString());
				} else if(userType.equalsIgnoreCase(UserType.EMPLOYEE.toString())) {
					/*//getting request parameters
					String username = request.getParameter("consumerusername");
					String password = request.getParameter("consumerpassword");
					String email = request.getParameter("consumeremail");
					String firstname = request.getParameter("consumerfirstname");
					String lastname = request.getParameter("consumerlastname");
					String gender = request.getParameter("consumergender");
					String phone = request.getParameter("consumerphone");
					
					//get 1-char value for gender
					String genderChar = getGender(gender); 
					
					//testing parameter values
					System.out.println("consumer post inputs: " + username +" "+ password +" "+ email +" "+ firstname +" "+ lastname +" "+ gender +" "+ phone);
					
					//generating the PAYLOAD to send the user service
					JsonObject payload = new JsonObject();
					payload.addProperty("username", username);
					payload.addProperty("password", password);
					payload.addProperty("primary_email", email);
					payload.addProperty("first_name", firstname);
					payload.addProperty("last_name", lastname);
					payload.addProperty("gender", genderChar);
					payload.addProperty("primary_phone", phone);
					
					//getting the response
					JsonObject serviceResponseJSON = userServiceComm.postUser("users/consumers", payload);
					//test the response
					System.out.println(serviceResponseJSON.toString());
					
					response.getWriter().append(serviceResponseJSON.toString());*/
				}
			} else if(task.equalsIgnoreCase(TaskType.PUT_USER.toString())) {
				
			} else if(task.equalsIgnoreCase(TaskType.DELETE_USER.toString())) {
				
			} else {
				throw new Exception("Invalid Task.");
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("Ex: "+ex);
			JsonObject jsonResponse = new JsonResponseBuilder().getJsonExceptionResponse("Error occurred while creating the account.");
			response.getWriter().append(jsonResponse.toString());
		}
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	private String getGender(String gender) {
		if (gender.equalsIgnoreCase("Male")) {
			return "M";
		} else if (gender.equalsIgnoreCase("Female")) {
			return "F";
		}

		return "O";
		
	}
}
