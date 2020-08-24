package com.bookstore.dao;

import java.util.Date;
import java.util.List;


import com.bookstore.entity.Book;

public class BookDAO extends JpaDAO<Book> implements GenericDAO<Book> {

	public BookDAO() {

	}

	@Override
	public Book create(Book book) {
		book.setLastUpdateTime(new Date());
		return super.create(book);
	}

	@Override
	public Book update(Book book) {
		book.setLastUpdateTime(new Date());
		return super.update(book);
	}

	@Override
	public Book get(Object bookId) {
		return super.find(Book.class, bookId);
	}

	@Override
	public void delete(Object bookId) {
		super.delete(Book.class, bookId);
	}

	@Override
	public List<Book> listAll() {

		return super.findWithNamedQuery("Book.findAll");
	}
 
//	@SuppressWarnings("unused")
	public Book findByTitle(String title) {
		List<Book> result = super.findWithNamedQuery("Book.findById", "title", title);
		
		if (!result.isEmpty()) {
			return result.get(0);
		}
		return null;
		
	}
	
	public List<Book> listByCategory(int CategoryId) {
		
		return super.findWithNamedQuery("Book.findByCategory", "catId", CategoryId);
	}
	
	public List<Book> listNewBooks() {
		return super.findWithNamedQuery("Book.listNew", 0, 4);
		
	}
	
	public List<Book> search(String keyword) {
		return super.findWithNamedQuery("Book.search", "keyword", keyword);
	}
	
	@Override
	public long count() {

		return super.countWithNamedQuery("Book.countAll");
	}
	
	public long countByCategory(int categoryId) {
		return super.countWithNamedQuery("Book.countByCategory", "catId", categoryId);
	}

}
