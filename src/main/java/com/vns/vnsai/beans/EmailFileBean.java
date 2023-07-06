package com.vns.vnsai.beans;

public class EmailFileBean {

	private String fileLocation;
	private String fileName;
	public String getFileLocation() {
		return fileLocation;
	}
	public void setFileLocation(String fileLocation) {
		this.fileLocation = fileLocation;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	@Override
	public String toString() {
		return "EmailFileBean [fileLocation=" + fileLocation + ", fileName=" + fileName + "]";
	}
	
}
