package com.jdc.shop.model;

import java.io.Serializable;
import java.util.List;

import com.jdc.shop.model.entity.Product;
import com.jdc.shop.model.entity.SaleItem;

public interface ShoppingCart extends Serializable {

	void add(Product product);
	
	void changeItemCount(boolean plus, int productId);
	
	void clear();

	int itemCount();

	int total();
	
	List<SaleItem> items();

	public static ShoppingCart generate() {
		return new ShoppingCartImpl();
	}
}
