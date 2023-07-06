package com.vns.vnsai.beans;

public class Media {

	private String url;
	private String filename;
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	@Override
	public String toString() {
		return "Media [url=" + url + ", filename=" + filename + "]";
	}
	
	
}
