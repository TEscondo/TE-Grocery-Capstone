package com.techelevator.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.Checkout;

@Component
public class CheckoutJDBCDAO implements CheckoutDAO {
	private JdbcTemplate template;

	public CheckoutJDBCDAO(DataSource datasource) {
		template = new JdbcTemplate(datasource);
	}

	@Override
	public List<Checkout> viewInventory() {
		String getInv = "select * from purchases";
		List <Checkout> inventory = new ArrayList<>();
		SqlRowSet result = template.queryForRowSet(getInv);
		while(result.next()) {
			int id = result.getInt("product_id");
			int inv = result.getInt("item_quantity");
		Checkout checkout = new Checkout(id, inv);
		inventory.add(checkout);
		}
		return inventory;	
	}

	@Override
	public void transferToCart(int productId, int quantity) {
		String sql = "Insert Into purchases (product_id, item_quantity) VALUES(?, ?)";
		template.update(sql, productId, quantity);
		updateProduct(quantity, productId);
	}

	@Override
	public void updateProduct(int quantity, int productId) {
		// TODO Auto-generated method stub
		String sql = "Update product Set inventory = inventory-? where product_id = ?";
		template.update(sql, quantity, productId);
	}
	
}
