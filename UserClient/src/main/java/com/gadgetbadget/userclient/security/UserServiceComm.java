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
	private static final String PAYMENT_SERVICE_URI = PROTOCOL + HOST + ":" + PORT + "/UserService/userservice/";

	private Client client = null;
	private WebResource webRes = null;


	public JsonObject authenticate(JsonObject payload)
	{
		client = Client.create();
		webRes = client.resource("http://localhost:8080/UserService/userservice/security/authenticate");//PAYMENT_SERVICE_URI+"security/authenticate");

		String output = webRes//.header("Authorization", SERVICE_TOKEN_FND)
				.entity(payload.toString(), MediaType.APPLICATION_JSON)
				.post(String.class);

		JsonObject JSONoutput = new JsonParser().parse(output).getAsJsonObject();
		return JSONoutput;
	}
	/*
	public JsonObject COPY(String absolutePath, HttpMethod httpMethod, JsonObject payload)
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
