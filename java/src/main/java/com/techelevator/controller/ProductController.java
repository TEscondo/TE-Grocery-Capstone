package com.techelevator.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.techelevator.model.Product;
import com.techelevator.service.ProductService;

@RestController
public class ProductController {

	ProductService productService = new ProductService();

	@RequestMapping(path = "/search", method = RequestMethod.GET)
	public List<Product> searchProduct(@RequestParam String query) throws JsonMappingException, JsonProcessingException {
		String url = "https://api.kroger.com/v1/products?filter.locationId=01800689&filter.term=" + query + "&limit=10";

		HttpEntity<String> httpEntity = new HttpEntity<>("");
		RestTemplate restTemplate = new RestTemplate();
		ObjectMapper objectMapper = new ObjectMapper();

		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, httpEntity, String.class);
		JsonNode jsonNode = objectMapper.readTree(response.getBody());
		List<Product> productList = productService.getProducts(jsonNode);
		System.out.println(productList);
		return productList;

	}
}
