package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.entity.User;

public  class UserDAOimpl implements UserDao {

	private Connection conn;

	public UserDAOimpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean userregister(User us) {
		boolean f = false;

		try {
			String sql = "insert into users(name,email,mobile_no,password)values (?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getMobile_no());
			ps.setString(4, us.getPassword());
			
		int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}

		return f;
	}

	public User login(String email, String password) {
		User us = null;
            try {
            	String sql="select * from users where email=? and password=?";
				 PreparedStatement ps=conn.prepareStatement(sql);
				 ps.setString(1, email);
				 ps.setString(2, password);
				 
				ResultSet rs= ps.executeQuery();
				
				while(rs.next()) {
					us=new User();
					us.setId(rs.getInt(1));
					us.setName(rs.getString(2));
					us.setEmail(rs.getString(3));
					us.setMobile_no(rs.getString(4));
					us.setPassword(rs.getString(5));
					us.setAddress(rs.getString(6));
					us.setLandmark(rs.getString(7));
					us.setCity(rs.getString(8));
					us.setState(rs.getString(9));
					us.setPincode(rs.getString(10));


				}

			} catch (Exception e) {
				e.printStackTrace();
			}
            return us;
	}

}
