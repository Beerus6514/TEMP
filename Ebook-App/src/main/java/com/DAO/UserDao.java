package com.DAO;

import com.entity.User;

public interface UserDao {
 public boolean userregister(User user);
	 
 public User login(String email ,String password);

}
