package com.gadgetbadget.userclient;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gadgetbadget.userclient.security.UserServiceComm;
import com.gadgetbadget.userclient.util.JsonResponseBuilder;
import com.gadgetbadget.userclient.util.OpStatus;
import com.gadgetbadget.userclient.util.RequestHashMapBuilder;
import com.gadgetbadget.userclient.util.TaskType;
import com.gadgetbadget.userclient.util.UserType;
import com.gadgetbadget.userclient.util.UserTypeLong;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
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
		JsonObject jsonResponse = getAllUsers(request);
		response.getWriter().append(jsonResponse.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String task = request.getParameter("formtask").toString().toUpperCase();
			String userType = request.getParameter("usertype").toString().toUpperCase();

			if(task.equalsIgnoreCase(TaskType.USERS.toString())) {
				if(userType.equalsIgnoreCase(UserTypeLong.CONSUMER.toString())) {
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

					//attach new account list if success
					if (serviceResponseJSON.get("STATUS").getAsString().equalsIgnoreCase(OpStatus.SUCCESSFUL.toString())) {
						//Making sure the Authorization Token Cookie is Available
						Cookie authCookie = getAuthCookie(request);

						if (authCookie != null) {

							//Attach the Authorization Token to the User Web Service Request
							String authToken = authCookie.getValue().toString();

							//get new list
							JsonObject newList = userServiceComm.getUsers("users/consumers", authToken);	

							//generating HTML table
							String consumerTable = generateConsumerTable(newList);

							serviceResponseJSON.addProperty("CON", consumerTable);
						}
					}

					response.getWriter().append(serviceResponseJSON.toString());

				} else if(userType.equalsIgnoreCase(UserTypeLong.FUNDER.toString())) {
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

					//attach new account list if success
					if (serviceResponseJSON.get("STATUS").getAsString().equalsIgnoreCase(OpStatus.SUCCESSFUL.toString())) {
						//Making sure the Authorization Token Cookie is Available
						Cookie authCookie = getAuthCookie(request);

						if (authCookie != null) {

							//Attach the Authorization Token to the User Web Service Request
							String authToken = authCookie.getValue().toString();

							//get new list
							JsonObject newList = userServiceComm.getUsers("users/funders", authToken);	

							//generating HTML table
							String funderTable = generateFunderTable(newList);

							serviceResponseJSON.addProperty("FUN", funderTable);	
						}
					}

					response.getWriter().append(serviceResponseJSON.toString());
				} else if(userType.equalsIgnoreCase(UserTypeLong.RESEARCHER.toString())) {
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

					//attach new account list if success
					if (serviceResponseJSON.get("STATUS").getAsString().equalsIgnoreCase(OpStatus.SUCCESSFUL.toString())) {
						//Making sure the Authorization Token Cookie is Available
						Cookie authCookie = getAuthCookie(request);

						if (authCookie != null) {

							//Attach the Authorization Token to the User Web Service Request
							String authToken = authCookie.getValue().toString();

							//get new list
							JsonObject newList = userServiceComm.getUsers("users/researchers", authToken);	

							//generating HTML table
							String researcherTable = generateResearcherTable(newList);

							serviceResponseJSON.addProperty("RES", researcherTable);	
						}
					}

					response.getWriter().append(serviceResponseJSON.toString());
				} else if(userType.equalsIgnoreCase(UserTypeLong.EMPLOYEE.toString())) {
					//getting request parameters
					String username = request.getParameter("employeeusername");
					String password = request.getParameter("employeepassword");
					String email = request.getParameter("employeeemail");
					String firstname = request.getParameter("employeefirstname");
					String lastname = request.getParameter("employeesecondname");
					String gender = request.getParameter("employeegender");
					String phone = request.getParameter("employeephone");
					String eid = request.getParameter("employeeeid");
					String dep = request.getParameter("employeedep");
					String date_hired = request.getParameter("employeedh");
					String role = request.getParameter("employeerole");

					//get 1-char value for gender
					String genderChar = getGender(gender);

					//get 5-char role-id for employee role
					String roleId = getRoleId(role);

					//testing parameter values
					System.out.println("consumer post inputs: " + username +" "+ password +" "+ email +" "+ firstname +" "+ lastname +" "+gender+" "+genderChar +" "+ phone+" "+eid+" "+dep+" "+date_hired+" "+roleId);

					//generating the PAYLOAD to send the user service
					JsonObject payload = new JsonObject();
					payload.addProperty("username", username);
					payload.addProperty("password", password);
					payload.addProperty("primary_email", email);
					payload.addProperty("first_name", firstname);
					payload.addProperty("last_name", lastname);
					payload.addProperty("gender", genderChar);
					payload.addProperty("primary_phone", phone);
					payload.addProperty("gb_employee_id", eid);
					payload.addProperty("department", dep);
					payload.addProperty("date_hired", date_hired);
					payload.addProperty("role_id", roleId);

					//getting the response
					JsonObject serviceResponseJSON = userServiceComm.postUser("users/employees", payload);
					//test the response
					System.out.println(serviceResponseJSON.toString());

					//attach new account list if success
					if (serviceResponseJSON.get("STATUS").getAsString().equalsIgnoreCase(OpStatus.SUCCESSFUL.toString())) {
						//Making sure the Authorization Token Cookie is Available
						Cookie authCookie = getAuthCookie(request);

						if (authCookie != null) {

							//Attach the Authorization Token to the User Web Service Request
							String authToken = authCookie.getValue().toString();

							//get new list
							JsonObject newList = userServiceComm.getUsers("users/employees", authToken);	

							//generating HTML table
							String employeeTable = generateEmployeeTable(newList);

							serviceResponseJSON.addProperty("EMP", employeeTable);	
						}
					}

					response.getWriter().append(serviceResponseJSON.toString());
				}
			} else  {
				throw new Exception("Invalid Request.");
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("Ex: "+ex);
			JsonObject jsonResponse = new JsonResponseBuilder().getJsonExceptionResponse("Error occurred while creating the account.\n" + ex.getMessage());
			response.getWriter().append(jsonResponse.toString());
		}
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Cookie authCookie = getAuthCookie(request);
			String authToken = null;

			if (authCookie == null) {
				JsonObject noAuthResponse = new JsonResponseBuilder().getJsonNoAuthorizationResponse("Authorization Token Not Found.");
				response.getWriter().append(noAuthResponse.toString());
				return;
			}

			authToken = authCookie.getValue().toString();

			HashMap<String, String> requestParameters = new RequestHashMapBuilder().getParameterHashMap(request);
			String task = requestParameters.get("formtask").toString().toUpperCase();
			String userType = requestParameters.get("usertype").toString().toUpperCase();

			//testing task and type
			System.out.println("task: "+task+" type: "+userType);

			if(task.equalsIgnoreCase(TaskType.USERS.toString())) {
				if(userType.equalsIgnoreCase(UserTypeLong.CONSUMER.toString())) {
					//getting request parameters
					String user_id = requestParameters.get("consumerisupdate");
					String username = requestParameters.get("consumerusername");
					String password = requestParameters.get("consumerpassword");
					String email = requestParameters.get("consumeremail");
					String firstname = requestParameters.get("consumerfirstname");
					String lastname = requestParameters.get("consumerlastname");
					String gender = requestParameters.get("consumergender");
					String phone = requestParameters.get("consumerphone");

					//get 1-char value for gender
					String genderChar = getGender(gender); 

					//testing parameter values
					System.out.println("consumer post inputs: " + user_id+" "+username +" "+ password +" "+ email +" "+ firstname +" "+ lastname +" "+ gender +" "+ genderChar +" "+ phone);

					//generating the PAYLOAD to send the user service
					JsonObject payload = new JsonObject();
					payload.addProperty("user_id", user_id);
					payload.addProperty("username", username);
					payload.addProperty("password", password);
					payload.addProperty("primary_email", email);
					payload.addProperty("first_name", firstname);
					payload.addProperty("last_name", lastname);
					payload.addProperty("gender", genderChar);
					payload.addProperty("primary_phone", phone);

					//getting the response
					JsonObject serviceResponseJSON = userServiceComm.putUser("users/consumers", payload, authToken);
					//test the response
					System.out.println(serviceResponseJSON.toString());

					//attach new account list if success
					if (serviceResponseJSON.get("STATUS").getAsString().equalsIgnoreCase(OpStatus.SUCCESSFUL.toString())) {
						//get new list
						JsonObject newList = userServiceComm.getUsers("users/consumers", authToken);	

						//generating HTML table
						String consumerTable = generateConsumerTable(newList);

						serviceResponseJSON.addProperty("CON", consumerTable);
					}

					response.getWriter().append(serviceResponseJSON.toString());

				} else if(userType.equalsIgnoreCase(UserTypeLong.FUNDER.toString())) {
					//getting request parameters
					String user_id = requestParameters.get("funderisupdate");
					String username = requestParameters.get("funderusername");
					String password = requestParameters.get("funderpassword");
					String email = requestParameters.get("funderemail");
					String firstname = requestParameters.get("funderfirstname");
					String lastname = requestParameters.get("fundersecondname");
					String gender = requestParameters.get("fundergender");
					String phone = requestParameters.get("funderphone");
					String organization = requestParameters.get("funderorg");

					//get 1-char value for gender
					String genderChar = getGender(gender); 

					//testing parameter values
					System.out.println("funder post inputs: " + user_id+" "+username +" "+ password +" "+ email +" "+ firstname +" "+ lastname +" "+ gender +" "+ genderChar +" "+ phone +" "+ organization);

					//generating the PAYLOAD to send the user service
					JsonObject payload = new JsonObject();
					payload.addProperty("user_id", user_id);
					payload.addProperty("username", username);
					payload.addProperty("password", password);
					payload.addProperty("primary_email", email);
					payload.addProperty("first_name", firstname);
					payload.addProperty("last_name", lastname);
					payload.addProperty("gender", genderChar);
					payload.addProperty("primary_phone", phone);
					payload.addProperty("organization", organization);

					//getting the response
					JsonObject serviceResponseJSON = userServiceComm.putUser("users/funders", payload, authToken);
					//test the response
					System.out.println(serviceResponseJSON.toString());

					//attach new account list if success
					if (serviceResponseJSON.get("STATUS").getAsString().equalsIgnoreCase(OpStatus.SUCCESSFUL.toString())) {
						//get new list
						JsonObject newList = userServiceComm.getUsers("users/funders", authToken);	

						//generating HTML table
						String funderTable = generateFunderTable(newList);

						serviceResponseJSON.addProperty("FUN", funderTable);
					}

					response.getWriter().append(serviceResponseJSON.toString());
				} else if(userType.equalsIgnoreCase(UserTypeLong.RESEARCHER.toString())) {
					//getting request parameters
					String user_id = requestParameters.get("researcherisupdate");
					String username = requestParameters.get("researcherusername");
					String password = requestParameters.get("researcherpassword");
					String email = requestParameters.get("researcheremail");
					String firstname = requestParameters.get("researcherfirstname");
					String lastname = requestParameters.get("researchersecondname");
					String gender = requestParameters.get("researchergender");
					String phone = requestParameters.get("researcherphone");
					String institution = requestParameters.get("researcherinstitute");
					String fos = requestParameters.get("researcherfos");
					String yoe = requestParameters.get("researcheryoe");

					//get 1-char value for gender
					String genderChar = getGender(gender); 

					//testing parameter values
					System.out.println("researcher post inputs: " + user_id+" "+username +" "+ password +" "+ email +" "+ firstname +" "+ lastname +" "+ gender +" "+ phone +" "+ institution +" "+ fos +" "+ yoe);

					//generating the PAYLOAD to send the user service
					JsonObject payload = new JsonObject();
					payload.addProperty("user_id", user_id);
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
					JsonObject serviceResponseJSON = userServiceComm.putUser("users/researchers", payload, authToken);
					//test the response
					System.out.println(serviceResponseJSON.toString());

					//attach new account list if success
					if (serviceResponseJSON.get("STATUS").getAsString().equalsIgnoreCase(OpStatus.SUCCESSFUL.toString())) {
						//get new list
						JsonObject newList = userServiceComm.getUsers("users/researchers", authToken);	

						//generating HTML table
						String researcherTable = generateResearcherTable(newList);

						serviceResponseJSON.addProperty("RES", researcherTable);
					}

					response.getWriter().append(serviceResponseJSON.toString());
				} else if(userType.equalsIgnoreCase(UserTypeLong.EMPLOYEE.toString())) {
					//getting request parameters
					String user_id = requestParameters.get("employeeisupdate");
					String username = requestParameters.get("employeeusername");
					String password = requestParameters.get("employeepassword");
					String email = requestParameters.get("employeeemail");
					String firstname = requestParameters.get("employeefirstname");
					String lastname = requestParameters.get("employeesecondname");
					String gender = requestParameters.get("employeegender");
					String phone = requestParameters.get("employeephone");
					String eid = requestParameters.get("employeeeid");
					String dep = requestParameters.get("employeedep");
					String date_hired = requestParameters.get("employeedh");

					//get 1-char value for gender
					String genderChar = getGender(gender);

					//testing parameter values
					System.out.println("employee post inputs: " + user_id+" "+username +" "+ password +" "+ email +" "+ firstname +" "+ lastname +" "+gender+" "+genderChar +" "+ phone+" "+eid+" "+dep+" "+date_hired);

					//generating the PAYLOAD to send the user service
					JsonObject payload = new JsonObject();
					payload.addProperty("user_id", user_id);
					payload.addProperty("username", username);
					payload.addProperty("password", password);
					payload.addProperty("primary_email", email);
					payload.addProperty("first_name", firstname);
					payload.addProperty("last_name", lastname);
					payload.addProperty("gender", genderChar);
					payload.addProperty("primary_phone", phone);
					payload.addProperty("gb_employee_id", eid);
					payload.addProperty("department", dep);
					payload.addProperty("date_hired", date_hired);

					//getting the response
					JsonObject serviceResponseJSON = userServiceComm.putUser("users/employees", payload, authToken);
					//test the response
					System.out.println(serviceResponseJSON.toString());

					//attach new account list if success
					if (serviceResponseJSON.get("STATUS").getAsString().equalsIgnoreCase(OpStatus.SUCCESSFUL.toString())) {
						//get new list
						JsonObject newList = userServiceComm.getUsers("users/employees", authToken);	

						//generating HTML table
						String employeeTable = generateEmployeeTable(newList);

						serviceResponseJSON.addProperty("EMP", employeeTable);
					}

					response.getWriter().append(serviceResponseJSON.toString());
				}
			} else  {
				throw new Exception("Invalid Request.");
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("Ex: "+ex);
			JsonObject jsonResponse = new JsonResponseBuilder().getJsonExceptionResponse("Error occurred while updating the account.\n" + ex.getMessage());
			response.getWriter().append(jsonResponse.toString());
		}
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Cookie authCookie = getAuthCookie(request);
			String authToken = null;

			if (authCookie == null) {
				JsonObject noAuthResponse = new JsonResponseBuilder().getJsonNoAuthorizationResponse("Authorization Token Not Found.");
				response.getWriter().append(noAuthResponse.toString());
				return;
			}

			authToken = authCookie.getValue().toString();

			HashMap<String, String> requestParameters = new RequestHashMapBuilder().getParameterHashMap(request);
			String task = requestParameters.get("task").toString().toUpperCase();
			String user_id = requestParameters.get("user_id").toString().toUpperCase();
			String userType = requestParameters.get("usertype").toString().toUpperCase();

			//testing task and type
			System.out.println("task: "+task+" id: "+user_id+" type: "+userType);

			if(task.equalsIgnoreCase(TaskType.USERS.toString())) {
				if(userType.equalsIgnoreCase(UserTypeLong.CONSUMER.toString())) {
					//generating the PAYLOAD to send the user service
					JsonObject payload = new JsonObject();
					payload.addProperty("user_id", user_id);

					//getting the response
					JsonObject serviceResponseJSON = userServiceComm.deleteUser("users/consumers", payload, authToken);
					//test the response
					System.out.println(serviceResponseJSON.toString());

					//attach new account list if success
					if (serviceResponseJSON.get("STATUS").getAsString().equalsIgnoreCase(OpStatus.SUCCESSFUL.toString())) {
						//get new list
						JsonObject newList = userServiceComm.getUsers("users/consumers", authToken);	

						//generating HTML table
						String consumerTable = generateConsumerTable(newList);

						serviceResponseJSON.addProperty("CON", consumerTable);
					}

					response.getWriter().append(serviceResponseJSON.toString());

				} else if(userType.equalsIgnoreCase(UserTypeLong.FUNDER.toString())) {
					//generating the PAYLOAD to send the user service
					JsonObject payload = new JsonObject();
					payload.addProperty("user_id", user_id);

					//getting the response
					JsonObject serviceResponseJSON = userServiceComm.deleteUser("users/funders", payload, authToken);
					//test the response
					System.out.println(serviceResponseJSON.toString());

					//attach new account list if success
					if (serviceResponseJSON.get("STATUS").getAsString().equalsIgnoreCase(OpStatus.SUCCESSFUL.toString())) {
						//get new list
						JsonObject newList = userServiceComm.getUsers("users/funders", authToken);	

						//generating HTML table
						String funderTable = generateFunderTable(newList);

						serviceResponseJSON.addProperty("FUN", funderTable);
					}

					response.getWriter().append(serviceResponseJSON.toString());
				} else if(userType.equalsIgnoreCase(UserTypeLong.RESEARCHER.toString())) {
					//generating the PAYLOAD to send the user service
					JsonObject payload = new JsonObject();
					payload.addProperty("user_id", user_id);

					//getting the response
					JsonObject serviceResponseJSON = userServiceComm.deleteUser("users/researchers", payload, authToken);
					//test the response
					System.out.println(serviceResponseJSON.toString());

					//attach new account list if success
					if (serviceResponseJSON.get("STATUS").getAsString().equalsIgnoreCase(OpStatus.SUCCESSFUL.toString())) {
						//get new list
						JsonObject newList = userServiceComm.getUsers("users/researchers", authToken);	

						//generating HTML table
						String researcherTable = generateResearcherTable(newList);

						serviceResponseJSON.addProperty("RES", researcherTable);
					}

					response.getWriter().append(serviceResponseJSON.toString());
				} else if(userType.equalsIgnoreCase(UserTypeLong.EMPLOYEE.toString())) {
					//generating the PAYLOAD to send the user service
					JsonObject payload = new JsonObject();
					payload.addProperty("user_id", user_id);

					//getting the response
					JsonObject serviceResponseJSON = userServiceComm.deleteUser("users/employees", payload, authToken);
					//test the response
					System.out.println(serviceResponseJSON.toString());

					//attach new account list if success
					if (serviceResponseJSON.get("STATUS").getAsString().equalsIgnoreCase(OpStatus.SUCCESSFUL.toString())) {
						//get new list
						JsonObject newList = userServiceComm.getUsers("users/employees", authToken);	

						//generating HTML table
						String employeeTable = generateEmployeeTable(newList);

						serviceResponseJSON.addProperty("EMP", employeeTable);
					}

					response.getWriter().append(serviceResponseJSON.toString());
				}
			} else  {
				throw new Exception("Invalid Request.");
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("Ex: "+ex);
			JsonObject jsonResponse = new JsonResponseBuilder().getJsonExceptionResponse("Error occurred while deleting the account.\n" + ex.getMessage());
			response.getWriter().append(jsonResponse.toString());
		}
	}

	private String getGender(String gender) {
		if (gender.equalsIgnoreCase("Male")) {
			return "M";
		} else if (gender.equalsIgnoreCase("Female")) {
			return "F";
		}

		return "O";

	}

	private String getRoleId(String role) {

		if (role.equalsIgnoreCase("Administrator")) {
			return UserType.ADMIN.toString();
		} else if (role.equalsIgnoreCase("Employee")) {
			return UserType.EMPLY.toString();
		} else if (role.equalsIgnoreCase("Financial Manager")) {
			return UserType.FNMGR.toString();
		}

		return UserType.INVLD.toString();
	}

	private Cookie getAuthCookie(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if( cookies == null ) {
			return null;
		}

		for (Cookie cookie : cookies) {

			if(cookie.getName().equalsIgnoreCase("gadgetbadget-auth")) {
				return cookie;
			}
		}

		return null;
	}

	private JsonObject getAllUsers(HttpServletRequest request) {
		//Making sure the Authorization Token Cookie is Available
		Cookie authCookie = getAuthCookie(request);
		JsonObject jsonResponse = null;

		if (authCookie == null) {
			jsonResponse = new JsonResponseBuilder().getJsonNoAuthorizationResponse("No Authorization Cookies found that are in a Valid state.");
			return jsonResponse;
		}

		//Attach the Authorization Token to the User Web Service Request
		String authToken = authCookie.getValue().toString();

		//getting the response
		JsonObject consumerAccountList = userServiceComm.getUsers("users/consumers", authToken);
		JsonObject funderAccountList = userServiceComm.getUsers("users/funders", authToken);
		JsonObject researcherAccountList = userServiceComm.getUsers("users/researchers", authToken);
		JsonObject employeeAccountList = userServiceComm.getUsers("users/employees", authToken);

		//test the response
		System.out.println(consumerAccountList.toString());
		System.out.println(funderAccountList.toString());
		System.out.println(researcherAccountList.toString());
		System.out.println(employeeAccountList.toString());

		//Generate HTML Tables
		String consumerTable = generateConsumerTable(consumerAccountList);
		String funderTable = generateFunderTable(funderAccountList);
		String researcherTable = generateResearcherTable(researcherAccountList);
		String employeeTable = generateEmployeeTable(employeeAccountList);

		jsonResponse = new JsonResponseBuilder().getJsonSuccessResponse("User data retrieved.");
		jsonResponse.addProperty("EMP", employeeTable);
		jsonResponse.addProperty("FUN", funderTable);
		jsonResponse.addProperty("CON", consumerTable);
		jsonResponse.addProperty("RES", researcherTable);

		return jsonResponse;
	}

	private String generateConsumerTable(JsonObject consumers) {
		if(consumers.has("MESSAGE")) {
			return consumers.get("MESSAGE").toString();
		}

		String tableStr = "<table class='table table-sm table-striped table-dark table-hover'><thead>"
				+ "<tr class='align-middle'><th>User ID</th>"
				+ "<th>First Name</th>"
				+ "<th>Last Name</th>"
				+ "<th>Gender</th>"
				+ "<th>Primary Email</th>"
				+ "<th>Primary Phone</th>"
				+ "<th>Update</th>"
				+ "<th>Delete</th>"
				+ "</tr></thread><tbody>";
		JsonArray consumerArr = consumers.get("consumers").getAsJsonArray();

		for(JsonElement consumerElem : consumerArr) {
			JsonObject consumer = consumerElem.getAsJsonObject();
			tableStr += "<tr><td>"+ consumer.get("user_id").getAsString() +"</td>"
					+ "<td>"+ consumer.get("first_name").getAsString() +"</td>"
					+ "<td>" + consumer.get("last_name").getAsString() + "</td>"
					+ "<td>"+ consumer.get("gender").getAsString() +"</td>"
					+ "<td>"+ consumer.get("primary_email").getAsString() +"</td>"
					+ "<td>"+ consumer.get("primary_phone").getAsString() +"</td>"
					+ "<td class='text-center align-middle'><input name='consumerupdate' id='consumerupdate' type='button' value='Update' class='btn btn-secondary btn-sm' data-consumerid='" + consumer.get("user_id").getAsString() + "' data-conun='"+ consumer.get("username").getAsString() +"' data-conpw='"+ consumer.get("password").getAsString() +"'></td>"
					+ "<td class='text-center align-middle'><input name='consumerdelete' id='consumerdelete' type='button' value='Delete' class='btn btn-danger btn-sm' data-consumerid='" + consumer.get("user_id").getAsString() + "'></td></tr>";
		}

		tableStr += "</tbody></table>";
		return tableStr;
	}

	private String generateResearcherTable(JsonObject researchers) {
		if(researchers.has("MESSAGE")) {
			return researchers.get("MESSAGE").toString();
		}

		String tableStr = "<table class='table table-sm table-striped table-dark table-hover'><thead>"
				+ "<tr class='align-middle'><th>User ID</th>"
				+ "<th>First Name</th>"
				+ "<th>Last Name</th>"
				+ "<th>Gender</th>"
				+ "<th>Primary Email</th>"
				+ "<th>Primary Phone</th>"
				+ "<th>Institution</th>"
				+ "<th>Field of Study</th>"
				+ "<th>Years of Experience</th>"
				+ "<th>Update</th>"
				+ "<th>Delete</th>"
				+ "</tr></thread><tbody>";
		JsonArray researcherArr = researchers.get("researchers").getAsJsonArray();

		for(JsonElement researcherElem : researcherArr) {
			JsonObject researcher = researcherElem.getAsJsonObject();
			tableStr += "<tr><td>"+ researcher.get("user_id").getAsString() +"</td>"
					+ "<td>"+ researcher.get("first_name").getAsString() +"</td>"
					+ "<td>" + researcher.get("last_name").getAsString() + "</td>"
					+ "<td>"+ researcher.get("gender").getAsString() +"</td>"
					+ "<td>"+ researcher.get("primary_email").getAsString() +"</td>"
					+ "<td>"+ researcher.get("primary_phone").getAsString() +"</td>"
					+ "<td>"+ researcher.get("institution").getAsString() +"</td>"
					+ "<td>"+ researcher.get("field_of_study").getAsString() +"</td>"
					+ "<td>"+ researcher.get("years_of_exp").getAsString() +"</td>"
					+ "<td class='text-center align-middle'><input name='researcherupdate' id='researcherupdate' type='button' value='Update' class='btn btn-secondary btn-sm' data-researcherid='" + researcher.get("user_id").getAsString() + "' data-resun='"+ researcher.get("username").getAsString() +"' data-respw='"+ researcher.get("password").getAsString() +"'></td>"
					+ "<td class='text-center align-middle'><input name='researcherdelete' id='researcherdelete' type='button' value='Delete' class='btn btn-danger btn-sm' data-researcherid='" + researcher.get("user_id").getAsString() + "'></td></tr>";
		}

		tableStr += "</tbody></table>";
		return tableStr;
	}

	private String generateFunderTable(JsonObject funders) {
		if(funders.has("MESSAGE")) {
			return funders.get("MESSAGE").toString();
		}

		String tableStr = "<table class='table table-sm table-striped table-dark table-hover'><thead>"
				+ "<tr class='align-middle'><th>User ID</th>"
				+ "<th>First Name</th>"
				+ "<th>Last Name</th>"
				+ "<th>Gender</th>"
				+ "<th>Primary Email</th>"
				+ "<th>Primary Phone</th>"
				+ "<th>Organization</th>"
				+ "<th>Update</th>"
				+ "<th>Delete</th>"
				+ "</tr></thread><tbody>";
		JsonArray funderArr = funders.get("funders").getAsJsonArray();

		for(JsonElement funderElem : funderArr) {
			JsonObject funder = funderElem.getAsJsonObject();
			tableStr += "<tr><td>"+ funder.get("user_id").getAsString() +"</td>"
					+ "<td>"+ funder.get("first_name").getAsString() +"</td>"
					+ "<td>" + funder.get("last_name").getAsString() + "</td>"
					+ "<td>"+ funder.get("gender").getAsString() +"</td>"
					+ "<td>"+ funder.get("primary_email").getAsString() +"</td>"
					+ "<td>"+ funder.get("primary_phone").getAsString() +"</td>"
					+ "<td>"+ funder.get("organization").getAsString() +"</td>"
					+ "<td class='text-center align-middle'><input name='funderupdate' id='funderupdate' type='button' value='Update' class='btn btn-secondary btn-sm' data-funderid='" + funder.get("user_id").getAsString() + "' data-funun='"+ funder.get("username").getAsString() +"' data-funpw='"+ funder.get("password").getAsString() +"'></td>"
					+ "<td class='text-center align-middle'><input name='funderdelete' id='funderdelete' type='button' value='Delete' class='btn btn-danger btn-sm' data-funderid='" + funder.get("user_id").getAsString() + "'></td></tr>";
		}

		tableStr += "</tbody></table>";
		return tableStr;
	}

	private String generateEmployeeTable(JsonObject employees) {
		if(employees.has("MESSAGE")) {
			return employees.get("MESSAGE").toString();
		}

		String tableStr = "<table class='table table-sm table-striped table-dark table-hover'><thead>"
				+ "<tr class='align-middle'><th>User ID</th>"
				+ "<th>First Name</th>"
				+ "<th>Last Name</th>"
				+ "<th>Gender</th>"
				+ "<th>Primary Email</th>"
				+ "<th>Primary Phone</th>"
				+ "<th>Employee ID</th>"
				+ "<th>Department</th>"
				+ "<th>Date Hired</th>"
				+ "<th>Update</th>"
				+ "<th>Delete</th>"
				+ "</tr></thread><tbody>";

		JsonArray employeeArr = employees.get("employees").getAsJsonArray();

		for(JsonElement employeeElem : employeeArr) {
			JsonObject employee = employeeElem.getAsJsonObject();
			tableStr += "<tr><td>"+ employee.get("user_id").getAsString() +"</td>"
					+ "<td>"+ employee.get("first_name").getAsString() +"</td>"
					+ "<td>"+ employee.get("last_name").getAsString() + "</td>"
					+ "<td>"+ employee.get("gender").getAsString() +"</td>"
					+ "<td>"+ employee.get("primary_email").getAsString() +"</td>"
					+ "<td>"+ employee.get("primary_phone").getAsString() +"</td>"
					+ "<td>"+ employee.get("gb_employee_id").getAsString() +"</td>"
					+ "<td>"+ employee.get("department").getAsString() +"</td>"
					+ "<td>"+ employee.get("date_hired").getAsString() +"</td>"
					+ "<td class='text-center align-middle'><input name='employeeupdate' id='employeeupdate' type='button' value='Update' class='btn btn-secondary btn-sm' data-employeeid='" + employee.get("user_id").getAsString() + "' data-empun='"+ employee.get("username").getAsString() +"' data-emppw='"+ employee.get("password").getAsString() +"'></td>"
					+ "<td class='text-center align-middle'><input name='employeedelete' id='employeedelete' type='button' value='Delete' class='btn btn-danger btn-sm' data-employeeid='" + employee.get("user_id").getAsString() + "'></td></tr>";
		}

		tableStr += "</tbody></table>";
		return tableStr;
	}
}