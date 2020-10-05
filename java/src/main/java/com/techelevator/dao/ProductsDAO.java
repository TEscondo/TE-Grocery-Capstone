package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.Product;

public interface ProductsDAO {

	List<Product> viewAllProducts();
	
	List<Product> viewProductsByCategory(String category);
	
	List<Product> viewProductsByBrand(String brand);
	
	List<Product> viewProductsBySale(boolean sale);
	
	List<Product> viewProductsByDescription(String searchTerm);
	
}
