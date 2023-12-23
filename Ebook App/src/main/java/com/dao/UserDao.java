package com.dao;

import com.entity.User;

public interface UserDao {

	public boolean UserRegister(User us);
	
	public User UserLogin(String email,String password);
	public boolean checkPassword(int id,String ps);
	public boolean updateProfile(User us,int id);
	public boolean checkUser(String mail);
}
