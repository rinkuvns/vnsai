package com.vns.vnsai.dao.impl;

import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;
import com.vns.vnsai.cons.CommonCons;

public class UnirestDaoImpl {

	public String sentTextMessage(String body) throws UnirestException {
		Unirest.setTimeouts(580000, 580000);
		HttpResponse<String> response = Unirest.post(CommonCons.aisensyUrl)
		  .header("Content-Type", "application/json")
		  .body(body)
		  .asString();
		return response.getBody().toString();
	}
	public String sentTextMediaMessage(String body) throws UnirestException {
		Unirest.setTimeouts(580000, 580000);
		HttpResponse<String> response = Unirest.post(CommonCons.aisensyUrl)
		  .header("Content-Type", "application/json")
		  .body(body)
		  .asString();
		return response.getBody().toString();
	}
}
