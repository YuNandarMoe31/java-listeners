package com.jdc.shop.model;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.jdc.shop.model.entity.SaleItem;
import com.jdc.shop.model.entity.Voucher;

public class SaleModelImp implements SaleModel {
	
	private List<Voucher> vouchers;
	
	public SaleModelImp() {
		vouchers = new ArrayList<Voucher>();
	}
	
	@Override
	public List<Voucher> getSaleHistory() {
		// TODO Auto-generated method stub
		return new ArrayList<Voucher>(vouchers);
	}

	@Override
	public Voucher findById(int id) {
		// TODO Auto-generated method stub
		
		for(var voucher : vouchers) {
			if(id == voucher.getId()) {
				return voucher;
			}
		}
		return null;
	}

	@Override
	public int create(String customer, List<SaleItem> sales) {
		// TODO Auto-generated method stub
		var voucher = new Voucher();
		voucher.setCustomer(customer);
		voucher.setSales(sales);
		voucher.setSaleTime(LocalDateTime.now());
		voucher.setId(vouchers.size() + 1);
		vouchers.add(voucher);
		
		return voucher.getId();
	}

}
