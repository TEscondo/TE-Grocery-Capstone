package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.Checkout;

public interface CheckoutDAO {
List <Checkout> viewInventory();

List <Checkout> transferToCart(int productId, Integer quantity);
}
