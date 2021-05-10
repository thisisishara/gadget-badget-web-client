package com.gadgetbadget.userclient.security;

import javax.ws.rs.core.MediaType;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;

public class UserServiceComm {
	private static final String PROTOCOL = "http://";
	private static final String HOST = "127.0.0.1";
	private static final String PORT = "8080";
	private static final String USER_SERVICE_URI = PROTOCOL + HOST + ":" + PORT + "/UserService/userservice/";

	private Client client = null;
	private WebResource webRes = null;

	//Authenticate [LOGIN-POST]
	public JsonObject authenticate(JsonObject payload)
	{
		client = Client.create();
		webRes = client.resource(USER_SERVICE_URI+"security/authenticate");

		String output = webRes//.header("Authorization", SERVICE_TOKEN_FND)
				.entity(payload.toString(), MediaType.APPLICATION_JSON)
				.post(String.class);

		JsonObject JSONoutput = new JsonParser().parse(output).getAsJsonObject();
		return JSONoutput;
	}
	
	//GET User
	public JsonObject getUsers(String absolutePath, String AuthToken)
	{
		client = Client.create();
		webRes = client.resource(USER_SERVICE_URI+absolutePath);

		String output = webRes.header("Authorization", "JWT " + AuthToken)
				.get(String.class);

		JsonObject JSONoutput = new JsonParser().parse(output).getAsJsonObject();
		return JSONoutput;
	}
	
	//POST User
	public JsonObject postUser(String absolutePath, JsonObject payload)
	{
		client = Client.create();
		webRes = client.resource(USER_SERVICE_URI+absolutePath);

		String output = webRes//.header("Authorization", SERVICE_TOKEN_FND)
				.entity(payload.toString(), MediaType.APPLICATION_JSON)
				.post(String.class);

		JsonObject JSONoutput = new JsonParser().parse(output).getAsJsonObject();
		return JSONoutput;
	}
	
	//PUT User
	public JsonObject putUser(String absolutePath, JsonObject payload, String AuthToken)
	{
		client = Client.create();
		webRes = client.resource(USER_SERVICE_URI+absolutePath);

		String output = webRes.header("Authorization", "JWT " + AuthToken)
				.entity(payload.toString(), MediaType.APPLICATION_JSON)
				.put(String.class);

		JsonObject JSONoutput = new JsonParser().parse(output).getAsJsonObject();
		return JSONoutput;
	}
	
	//DELETE User
	public JsonObject deleteUser(String absolutePath, JsonObject payload, String AuthToken)
	{
		client = Client.create();
		webRes = client.resource(USER_SERVICE_URI+absolutePath);

		String output = webRes.header("Authorization", "JWT " + AuthToken)
				.entity(payload.toString(), MediaType.APPLICATION_JSON)
				.delete(String.class);

		JsonObject JSONoutput = new JsonParser().parse(output).getAsJsonObject();
		return JSONoutput;
	}
	/*
	public JsonObject getUsers(String absolutePath, HttpMethod httpMethod, JsonObject payload)
	{
		client = Client.create();
		webRes = client.resource(PAYMENT_SERVICE_URI+absolutePath);

		if(httpMethod == HttpMethod.GET) {
			String output = webRes.header("Authorization", SERVICE_TOKEN_USR)
					.get(String.class);

			return new JsonParser().parse(output).getAsJsonObject();
		}
		return null;
	}*/
}
