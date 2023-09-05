package com.DAO;

import java.util.List;

import com.entity.Cart;

public interface CartDao {
	
	public boolean AddtoCart(Cart c);
	
	public List<Cart> getbookbyuserid(int userid);
	
	public boolean removebook(int bid ,int uid);


}
