package com.techelevator.model;

import java.math.BigDecimal;

public class Product {

	private String productName;
	private BigDecimal price;
	private BigDecimal salePrice;
	private boolean sale;
	private String brandName;
	private String description;
	private double weight;
	private String UPC;
	private String category;
	private String subcategory;
	private String imageUrl;
	
	public Product(String productName, String image, BigDecimal price, double weight) {
		this.productName = productName;
		this.imageUrl = image;
		this.price = price;
		this.weight = weight;
	}
	
	public Product(String productName, BigDecimal price, BigDecimal salePrice, boolean sale, String brandName,
			String description, double weight, String UPC, String category, String subcategory, String imageUrl) {
		this.productName = productName;
		this.price = price;
		this.salePrice = salePrice;
		this.sale = sale;
		this.brandName = brandName;
		this.description = description;
		this.weight = weight;
		this.UPC = UPC;
		this.category = category;
		this.subcategory = subcategory;
		this.imageUrl = imageUrl;
	}
	
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public BigDecimal getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(BigDecimal salePrice) {
		this.salePrice = salePrice;
	}
	public boolean isSale() {
		return sale;
	}
	public void setSale(boolean sale) {
		this.sale = sale;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	public String getUPC() {
		return UPC;
	}
	public void setUPC(String uPC) {
		UPC = uPC;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSubcategory() {
		return subcategory;
	}
	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
	
}
