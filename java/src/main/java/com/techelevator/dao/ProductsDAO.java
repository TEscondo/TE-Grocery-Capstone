package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.Product;

public interface ProductsDAO {

	List<Product> viewAllProducts();
	
	List<Product> viewProductsByCategory(int categoryId);
	
	List<Product> viewProductsByBrand(int brand);
	
	List<Product> viewProductsBySale();
	List<Product>viewProductDetails(int id);
	

	
}
