package com.dao;

import java.util.List;

import com.entity.BookDtls;

public interface BookDao {

	public boolean addBooks(BookDtls b);
	public List<BookDtls> getAllBooks();
	public BookDtls getBookById(int id);
	public boolean updateEditBooks(BookDtls b);
	public boolean deleteBook(int id);
	public List<BookDtls> getNewBook();
	public List<BookDtls> getRecentBook();
	public List<BookDtls> getOldBook();
	public List<BookDtls> getAllRecentBook();
	public List<BookDtls> getAllNewBook();
	public List<BookDtls> getAllOldBook();
	public List<BookDtls> getBookByOld(String mail,String cat);
	public boolean oldBookDelete(String user,String cat,int bid);
	public List<BookDtls> getBookBySearch(String ch);
}
