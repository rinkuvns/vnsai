package com.vns.vnsai.beans;

import java.util.Arrays;

public class TextMessageMediaTemplateBean {
	private String apiKey;
	private String campaignName;
	private String destination;
	private String userName;
	private String[] templateParams;
	private Media media;
	public String getApiKey() {
		return apiKey;
	}
	public void setApiKey(String apiKey) {
		this.apiKey = apiKey;
	}
	public String getCampaignName() {
		return campaignName;
	}
	public void setCampaignName(String campaignName) {
		this.campaignName = campaignName;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String[] getTemplateParams() {
		return templateParams;
	}
	public void setTemplateParams(String[] templateParams) {
		this.templateParams = templateParams;
	}
	public Media getMedia() {
		return media;
	}
	public void setMedia(Media media) {
		this.media = media;
	}
	@Override
	public String toString() {
		return "TextMessageMediaTemplateBean [apiKey=" + apiKey + ", campaignName=" + campaignName + ", destination="
				+ destination + ", userName=" + userName + ", templateParams=" + Arrays.toString(templateParams)
				+ ", media=" + media + "]";
	}
	
	

}
