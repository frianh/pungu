package com.bean;

import java.math.BigDecimal;
import java.util.Date;

public class InvoiceBean {
	private int invoiceNumber;
	private String name;
	private String address;
	private String title;
	private String description;
	private int qty;
	private String remark;
	private BigDecimal rate;
	private BigDecimal total;
	private BigDecimal discount;
	private BigDecimal grandTotal;
	private BigDecimal downPayment;
	private String downPaymentStatus;
	private BigDecimal remainingPayment;
	private String createBy;
	private Date createDate;
	private String currentStatus;
	private String act;
	private String remarkHistory;
	
	public String getDownPaymentStatus() {
		return downPaymentStatus;
	}
	
	public void setDownPaymentStatus(String downPaymentStatus) {
		this.downPaymentStatus = downPaymentStatus;
	}
	
	public String getRemarkHistory() {
		return remarkHistory;
	}
	
	public void setRemarkHistory(String remarkHistory) {
		this.remarkHistory = remarkHistory;
	}
	
	public String getAct() {
		return act;
	}
	
	public void setAct(String act) {
		this.act = act;
	}
	
	public String getCurrentStatus() {
		return currentStatus;
	}
	
	public void setCurrentStatus(String currentStatus) {
		this.currentStatus = currentStatus;
	}
	
	public String getCreateBy() {
		return createBy;
	}
	
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	
	public BigDecimal getRemainingPayment() {
		return remainingPayment;
	}
	
	public void setRemainingPayment(BigDecimal remainingPayment) {
		this.remainingPayment = remainingPayment;
	}
	
	public BigDecimal getDownPayment() {
		return downPayment;
	}
	
	public void setDownPayment(BigDecimal downPayment) {
		this.downPayment = downPayment;
	}
	
	public BigDecimal getGrandTotal() {
		return grandTotal;
	}
	
	public void setGrandTotal(BigDecimal grandTotal) {
		this.grandTotal = grandTotal;
	}
	
	public BigDecimal getDiscount() {
		return discount;
	}
	
	public void setDiscount(BigDecimal discount) {
		this.discount = discount;
	}
	
	public BigDecimal getTotal() {
		return total;
	}
	
	public void setTotal(BigDecimal total) {
		this.total = total;
	}
	
	public BigDecimal getRate() {
		return rate;
	}
	
	public void setRate(BigDecimal rate) {
		this.rate = rate;
	}
	
	public String getRemark() {
		return remark;
	}
	
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public int getQty() {
		return qty;
	}
	
	public void setQty(int qty) {
		this.qty = qty;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public Date getCreateDate() {
		return createDate;
	}
	
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public int getInvoiceNumber() {
		return invoiceNumber;
	}
	
	public void setInvoiceNumber(int invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
}
