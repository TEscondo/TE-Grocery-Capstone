package com.techelevator.dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.Product;
@Component
public class ProductsJDBCDAO implements ProductsDAO {
	private JdbcTemplate template;
	public ProductsJDBCDAO(DataSource datasource) {
		template = new JdbcTemplate(datasource);
	}
	@Override
	public List<Product> viewAllProducts() {
		// TODO Auto-generated method stub
		String getAllProducts= "SELECT * FROM Product";
		List<Product> allProducts = new ArrayList<>();
		SqlRowSet result = template.queryForRowSet(getAllProducts);
		while(result.next()) {
		
			String title = result.getString("title");
			double weight= result.getDouble("weight");
			String image = result.getString("image");
			BigDecimal price = result.getBigDecimal("price");
			
			Product product = new Product( title, image, price, weight);
			allProducts.add(product);
		}
		return allProducts;
	}

	
	
	
	
	@Override
	public List<Product> viewProductsByCategory(int categoryId) {
		// TODO Auto-generated method stub
		String productsByCat= "Select * from Product where category_id = ? ";
		List<Product>productCat= new ArrayList<>();
		SqlRowSet result = template.queryForRowSet(productsByCat, categoryId);
		while(result.next()) {
			String title = result.getString("title");
			double weight= result.getDouble("weight");
			String image = result.getString("image");
			BigDecimal price = result.getBigDecimal("price");
			
			Product product = new Product( title, image, price, weight);
			productCat.add(product);
		}
		return productCat;
	}

	
	
	
	
	
	@Override
	public List<Product> viewProductsByBrand(int brandId) {
		String productsByBrand= "Select * from Product where brandId = ? ";
		List<Product>productBrand= new ArrayList<>();
		SqlRowSet result = template.queryForRowSet(productsByBrand, brandId);
		while(result.next()) {
			String title = result.getString("title");
			double weight= result.getDouble("weight");
			String image = result.getString("image");
			BigDecimal price = result.getBigDecimal("price");
			
			Product product = new Product( title, image, price, weight);
			productBrand.add(product);
		}
		return productBrand;
	
	}

	
	
	
	
	
	@Override
	public List<Product> viewProductsBySale() {
		String productsBySale= "Select * from Product where sale = true ";
		List<Product>productSale= new ArrayList<>();
		SqlRowSet result = template.queryForRowSet(productsBySale);
		while(result.next()) {
			String title = result.getString("title");
			double weight= result.getDouble("weight");
			String image = result.getString("image");
			BigDecimal price = result.getBigDecimal("price");
			
			Product product = new Product( title, image, price, weight);
			productSale.add(product);
		}
		return productSale;
	}
	
	
	
	
	
	
	@Override
	public List<Product> viewProductDetails(int productId) {
		// TODO Auto-generated method stub
		String getAllProducts= "SELECT * FROM Product where product_id = ?";
		List<Product> productDetails = new ArrayList<>();
		SqlRowSet result = template.queryForRowSet(getAllProducts, productId);
		while(result.next()) {
			int id = result.getInt("product_id");
			String title = result.getString("title");
			int brandId = result.getInt("brand_id");
			String details= result.getString("details");
			double weight= result.getDouble("weight");
			int category = result.getInt("category_id");
			String image = result.getString("image");
			String certification = result.getString("certification");
			Boolean sale= result.getBoolean("sale");
			BigDecimal price = result.getBigDecimal("price");
			
			Product product = new Product(id, title, brandId, details, weight, category, image, certification, sale, price);
			productDetails.add(product);
		}
		return productDetails;
		
	}

}
