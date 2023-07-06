package com.vns.vnsai.controller;

import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.mashape.unirest.http.exceptions.UnirestException;
import com.vns.vnsai.beans.TextMessageMediaTemplateBean;
import com.vns.vnsai.beans.TextMessageTemplateBean;
import com.vns.vnsai.beans.TextMessgaeMediaParamBean;
import com.vns.vnsai.beans.TextMessgaeParamBean;
import com.vns.vnsai.cons.CommonCons;
import com.vns.vnsai.dao.impl.UnirestDaoImpl;

@RequestMapping("/Api")
@RestController
public class ApiController {
	

	@PostMapping("/sentTextMsg")
	public String textTypeTemplateMessage(@RequestBody TextMessgaeParamBean body) {
		TextMessageTemplateBean messageTemplateBean=new TextMessageTemplateBean();
		messageTemplateBean.setApiKey(CommonCons.apiKey);
		messageTemplateBean.setCampaignName(body.getCampaignName());
		messageTemplateBean.setDestination(body.getDestination());
		messageTemplateBean.setUserName(body.getUserName());
		messageTemplateBean.setTemplateParams(body.getTemplateParams());
		Gson gson=new Gson();
		String json=gson.toJson(messageTemplateBean);
		UnirestDaoImpl unirestDaoImpl=new UnirestDaoImpl();
		String data="";
		try {
			data=unirestDaoImpl.sentTextMessage(json);
		} catch (UnirestException e) {
			System.out.println(e.getMessage());
		}
		return data;
	}
	@PostMapping("/sentTextMedia")
	public String textTypeTemplateMessageMedia(@RequestBody TextMessgaeMediaParamBean body) {
		TextMessageMediaTemplateBean messageTemplateBean=new TextMessageMediaTemplateBean();
		messageTemplateBean.setApiKey(CommonCons.apiKey);
		messageTemplateBean.setCampaignName(body.getCampaignName());
		messageTemplateBean.setDestination(body.getDestination());
		messageTemplateBean.setUserName(body.getUserName());
		messageTemplateBean.setTemplateParams(body.getTemplateParams());
		messageTemplateBean.setMedia(body.getMedia());
		Gson gson=new Gson();
		String json=gson.toJson(messageTemplateBean);
		UnirestDaoImpl unirestDaoImpl=new UnirestDaoImpl();
		String data="";
		try {
			data=unirestDaoImpl.sentTextMediaMessage(json);
		} catch (UnirestException e) {
			System.out.println(e.getMessage());
		}
		return data;
	}
	
	@PostMapping("/hello")
	public String nn() {
		//TextMessgaeParamBean body=new TextMessgaeParamBean();
		return "Hello"; 
	}
}
