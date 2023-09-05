package com.DAO;

import java.util.List;

import com.entity.Bookdetails;

public interface BooksDAO {
	public boolean addBooks(Bookdetails b);
	
	public List<Bookdetails> getAllBooks();
	
	public Bookdetails getBookbyid(int id);
	
	public boolean updatebooks(Bookdetails book);
	public boolean deletebook(int id);
	
	public List<Bookdetails> getNewBooks();

	public List<Bookdetails> getrecentBooks();
	public List<Bookdetails> getoldBooks();
	
	public List<Bookdetails> getallNewBooks();
	public List<Bookdetails> getallRecentBooks();
	public List<Bookdetails> getallOldBooks();

}
