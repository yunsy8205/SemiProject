package com.semi.main.auth;

import lombok.Data;


@Data
public class SNSValue {
	
	private String service;
	
	private String clientId;
	
	private String clientSecret;
	
	private String redirectUrl;

	
	public String getService() {
		return service;
	}

	public String getClientId() {
		return clientId;
	}

	public String getClientSecret() {
		return clientSecret;
	}

	public String getRedirectUrl() {
		return redirectUrl;
	}

	public void setService(String service) {
		this.service = service;
	}

	public void setClientId(String clientId) {
		this.clientId = clientId;
	}

	public void setClientSecret(String clientSecret) {
		this.clientSecret = clientSecret;
	}

	public void setRedirectUrl(String redirectUrl) {
		this.redirectUrl = redirectUrl;
	}
	
	

}
