package edu.kosmo.kbat.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties("storage")
public class StorageProperties {

	/**
	 * Folder location for storing files
	 */
    //@Value("${uploadPath}")//ssj
    //String uploadPath;//ssj
	
	//private String location = "upload-dir";
	private String location = "c:\\upload-dir";//ssj
    //private String location = uploadPath;

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

}
