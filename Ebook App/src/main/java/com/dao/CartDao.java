package com.dao;

import java.util.List;

import com.entity.Cart;

public interface CartDao {

	
	public boolean addCart(Cart c);
	public List<Cart> getBookByUser(int userId);
	public boolean deletBook(int id, int uid,int cid);
}
