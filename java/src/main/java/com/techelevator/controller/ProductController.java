package com.techelevator.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.techelevator.dao.ProductsDAO;
import com.techelevator.model.Product;
import com.techelevator.service.ProductService;
@CrossOrigin
@RestController
public class ProductController {

	@Autowired
ProductsDAO dao;

	
	@RequestMapping(path="/test", method=RequestMethod.GET)
public void test() {
	System.out.println("It's working");
}

	
@PreAuthorize("permitAll()")	
	@RequestMapping(path="/allProducts", method = RequestMethod.GET)	
	public List<Product> viewAllProducts(){
		List<Product> allProducts= dao.viewAllProducts();
	return allProducts;
}
	@RequestMapping(path="/byCategory/{categoryId}", method= RequestMethod.GET)
	public List<Product> viewProductsByCategory(@PathVariable int categoryId){
		List<Product> productsCat = dao.viewProductsByCategory(categoryId);
		return productsCat;
	}
	
	
	@RequestMapping(path = "/byBrand/{brandId}", method= RequestMethod.GET)
	public List<Product> viewProductsByBrand(@PathVariable int brandId){
		List<Product> productBrand = dao.viewProductsByBrand(brandId);
		return productBrand;
	}
	
	
	@RequestMapping(path= "/bySale", method = RequestMethod.GET)
	public List<Product> bySale(){
		List<Product> saleItems= dao.viewProductsBySale();
		return saleItems;
	}
	
	@RequestMapping(path = "/details/{productId}", method=RequestMethod.GET)
	public List<Product> viewDetails(@PathVariable int productId){
		List<Product> itemDetails= dao.viewProductDetails(productId);
		return itemDetails;
	}
	
//	ProductService productService = new ProductService();
//	
//	@RequestMapping(path = "/search", method = RequestMethod.GET)
//	public List<Product> searchProduct(@RequestParam String query) throws JsonMappingException, JsonProcessingException {
//		String url = "https://api.kroger.com/v1/products?filter.locationId=01800689&filter.term=" + query + "&limit=10";
//		
//		HttpEntity<String> httpEntity = new HttpEntity<>("");
//		RestTemplate restTemplate = new RestTemplate();
//		ObjectMapper objectMapper = new ObjectMapper();
//		
//		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, httpEntity, String.class);
//		JsonNode jsonNode = objectMapper.readTree(response.getBody());
//		List<Product> productList = productService.getProducts(jsonNode);
//		System.out.println(productList);
//		return productList;
//		
//	}
	
	
	
	
	
}
