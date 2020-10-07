package com.techelevator.model;

import java.math.BigDecimal;

public class Product {

	private String title;
	private BigDecimal price;
	private boolean sale;
	private int brandId;
	private String details;
	private double weight;
	private int id;
	private int categoryId;
	private String image;
	private String certification;
	
	public Product(String title, String image, BigDecimal price, double weight) {
		this.title =title;
		this.image = image;
		this.price = price;
		this.weight = weight;
	}

	
	
	
	
	
	
	
	public Product(int id, String title, int brandId, String details, double weight, int categoryId, String image, boolean sale, BigDecimal price) {
		
		this.title = title;
		this.price = price;
		this.sale = sale;
		this.brandId = brandId;
		this.details = details;
		this.weight = weight;
		this.id = id;
		this.categoryId = categoryId;
		this.image = image;

	}








	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public boolean isSale() {
		return sale;
	}

	public void setSale(boolean sale) {
		this.sale = sale;
	}

	public int getBrandId() {
		return brandId;
	}

	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategory(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getCertification() {
		return certification;
	}

	public void setCertification(String certification) {
		this.certification = certification;
	}
	

	
	
}
