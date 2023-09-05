package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Bookdetails;

public class BookDAOimpl implements BooksDAO {
	private Connection conn;

	public BookDAOimpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addBooks(Bookdetails b) {
		boolean f = false;
		try {
			String sql = "insert into bookdetails (bookname, author, price, bookCategory, status, imagename, email) values (?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookcategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getImageurl());
			ps.setString(7, b.getEmail());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return f;

	}

	@Override
	public List<Bookdetails> getAllBooks() {
		List<Bookdetails> list = new ArrayList<Bookdetails>();
		Bookdetails b = null;
		try {
			String sql = "select * from bookdetails";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new Bookdetails();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setImageurl(rs.getNString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Bookdetails getBookbyid(int id) {
		Bookdetails b=null;
		try {
		String sql="select * from bookdetails where bookId=?"; 
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
		b=new Bookdetails();
		b.setBookid(rs.getInt(1));
		b.setBookname(rs.getString(2));
		b.setAuthor(rs.getString(3));
		b.setPrice(rs.getString(4));
		b.setBookcategory(rs.getString(5));
		b.setStatus(rs.getString(6));
		b.setImageurl(rs.getString(7)); 
		b.setEmail(rs.getString(8));
		}
		} catch (Exception e) { 
			e.printStackTrace();
		}
		return b;
	}

	@Override
	public boolean updatebooks(Bookdetails book) {
		boolean f=false; 
		try {
			String sql="update bookdetails set bookname=?, author=?, price=?, status=?,imagename=? where bookId=?";
			PreparedStatement ps=conn.prepareStatement (sql);
			ps.setString(1, book.getBookname()); 
			ps.setString(2, book.getAuthor()); 
			ps.setString(3,book.getPrice());
			ps.setString(4, book.getStatus()); 
			ps.setString(5, book.getImageurl());
			ps.setInt(6, book.getBookid());
			int i=ps.executeUpdate();
			if(i==1){
				f=true;
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return f;
	}

	@Override
	public boolean deletebook(int id) {
		boolean f=false;
		try {
			String sql = "delete from bookdetails where bookId=?";
			PreparedStatement ps = conn.prepareStatement(sql); 
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) { 
				f = true;
				}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<Bookdetails> getNewBooks() {
		List<Bookdetails> list=new ArrayList<Bookdetails>(); 
		Bookdetails b=null;
		try {
		String sql="select * from bookdetails  where bookcategory=? and status=? order by bookId DESC";
		PreparedStatement ps=conn.prepareStatement(sql); 
		ps.setString(1, "New");
		ps.setString(2, "Active");
		ResultSet rs=ps.executeQuery();
		int i=1; 
		while(rs.next() && i<=4)
		{
		b=new Bookdetails();
		b.setBookid(rs.getInt(1));
		b.setBookname (rs.getString(2));
		b.setAuthor (rs.getString(3));
		b.setPrice(rs.getString(4));
		b.setBookcategory (rs.getString(5));
		b.setStatus(rs.getString(6));
		b.setImageurl(rs.getString(7));
		b.setEmail(rs.getString(8));
		list.add(b);
		i++;
		}
		
	}catch (Exception e) {
		e.printStackTrace();
	}
		return list;
	}

	@Override
	public List<Bookdetails> getrecentBooks() {
		List<Bookdetails> list=new ArrayList<Bookdetails>(); 
		Bookdetails b=null;
		try {
		String sql="select * from bookdetails  where status=? order by bookId DESC";
		PreparedStatement ps=conn.prepareStatement(sql); 
		ps.setString(1, "Active");
		ResultSet rs=ps.executeQuery();
		int i=1; 
		while(rs.next() && i<=4)
		{
		b=new Bookdetails();
		b.setBookid(rs.getInt(1));
		b.setBookname (rs.getString(2));
		b.setAuthor (rs.getString(3));
		b.setPrice(rs.getString(4));
		b.setBookcategory (rs.getString(5));
		b.setStatus(rs.getString(6));
		b.setImageurl(rs.getString(7));
		b.setEmail(rs.getString(8));
		list.add(b);
		i++;
		}
		
	}catch (Exception e) {
		e.printStackTrace();
	}
		return list;
	}

	@Override
	public List<Bookdetails> getoldBooks() {
		List<Bookdetails> list=new ArrayList<Bookdetails>(); 
		Bookdetails b=null;
		try {
		String sql="select * from bookdetails  where bookcategory=? and status=? order by bookId DESC";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1, "Old");
		ps.setString(2, "Active");
		ResultSet rs=ps.executeQuery();
		int i=1; 
		while(rs.next() && i<=4)
		{
		b=new Bookdetails();
		b.setBookid(rs.getInt(1));
		b.setBookname (rs.getString(2));
		b.setAuthor (rs.getString(3));
		b.setPrice(rs.getString(4));
		b.setBookcategory (rs.getString(5));
		b.setStatus(rs.getString(6));
		b.setImageurl(rs.getString(7));
		b.setEmail(rs.getString(8));
		list.add(b);
		i++;
		}
		
	}catch (Exception e) {
		e.printStackTrace();
	}
		return list;
	}

	@Override
	public List<Bookdetails> getallNewBooks() {
		List<Bookdetails> list=new ArrayList<Bookdetails>(); 
		Bookdetails b=null;
		try {
		String sql="select * from bookdetails  where bookcategory=? and status=? order by bookId DESC";
		PreparedStatement ps=conn.prepareStatement(sql); 
		ps.setString(1, "New");
		ps.setString(2, "Active");
		ResultSet rs=ps.executeQuery();	
		
		while(rs.next())
		{
		b=new Bookdetails();
		b.setBookid(rs.getInt(1));
		b.setBookname (rs.getString(2));
		b.setAuthor (rs.getString(3));
		b.setPrice(rs.getString(4));
		b.setBookcategory (rs.getString(5));
		b.setStatus(rs.getString(6));
		b.setImageurl(rs.getString(7));
		b.setEmail(rs.getString(8));
		list.add(b);
		}
	}catch (Exception e) {
		e.printStackTrace();
	}
		return list;
	}

	@Override
	public List<Bookdetails> getallRecentBooks() {
		List<Bookdetails> list=new ArrayList<Bookdetails>(); 
		Bookdetails b=null;
		try {
		String sql="select * from bookdetails  where status=? order by bookId DESC";
		PreparedStatement ps=conn.prepareStatement(sql); 
		ps.setString(1, "Active");
		ResultSet rs=ps.executeQuery();
  
		while(rs.next())
		{
		b=new Bookdetails();
		b.setBookid(rs.getInt(1));
		b.setBookname (rs.getString(2));
		b.setAuthor (rs.getString(3));
		b.setPrice(rs.getString(4));
		b.setBookcategory (rs.getString(5));
		b.setStatus(rs.getString(6));
		b.setImageurl(rs.getString(7));
		b.setEmail(rs.getString(8));
		list.add(b);
		}
	}catch (Exception e) {
		e.printStackTrace();
	}
		return list;
	}

	@Override
	public List<Bookdetails> getallOldBooks() {
		List<Bookdetails> list=new ArrayList<Bookdetails>(); 
		Bookdetails b=null;
		try {
		String sql="select * from bookdetails  where bookcategory=? and status=? order by bookId DESC";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1, "Old");
		ps.setString(2, "Active");
		ResultSet rs=ps.executeQuery();
	
		while(rs.next())
		{
		b=new Bookdetails();
		b.setBookid(rs.getInt(1));
		b.setBookname (rs.getString(2));
		b.setAuthor (rs.getString(3));
		b.setPrice(rs.getString(4));
		b.setBookcategory (rs.getString(5));
		b.setStatus(rs.getString(6));
		b.setImageurl(rs.getString(7));
		b.setEmail(rs.getString(8));
		list.add(b);
	
		}
		
	}catch (Exception e) {
		e.printStackTrace();
	}
		return list;
	}
	
	
}
