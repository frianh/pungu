package com.bean;

import java.util.Date;

public class SimBean {
	private String rates;
	private Date lastUpdate;
	private String updateBy;
	private String price;
	
	public String getRates() {
		return rates;
	}
	
	public void setRates(String rates) {
		this.rates = rates;
	}
	
	public Date getLastUpdate() {
		return lastUpdate;
	}
	
	public void setLastUpdate(Date lastUpdate) {
		this.lastUpdate = lastUpdate;
	}
	
	public String getUpdateBy() {
		return updateBy;
	}
	
	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}
	
	public String getPrice() {
		return price;
	}
	
	public void setPrice(String price) {
		this.price = price;
	}
}
