package com.techelevator.model;

public class Checkout {
public int productId;
public int inventorynum;


public Checkout(int productId, int inventorynum) {
	
	this.productId = productId;
	this.inventorynum = inventorynum;
}
public int getProductId() {
	return productId;
}
public void setProductId(int productId) {
	this.productId = productId;
}
public int getInventorynum() {
	return inventorynum;
}
public void setInventorynum(int inventorynum) {
	this.inventorynum = inventorynum;
}
}
