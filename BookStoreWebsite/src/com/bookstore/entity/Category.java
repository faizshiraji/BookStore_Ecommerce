package com.bookstore.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

//@SuppressWarnings("serial")
@Entity
@Table(name = "category", catalog = "bookstoredb")
@NamedQueries({
	
	@NamedQuery(name = "Category.findAll", query = "SELECT c FROM Category c ORDER BY c.name"),
	@NamedQuery(name = "Category.countAll", query = "SELECT Count(c) FROM Category c")
	
})
public class Category implements java.io.Serializable {

	private int categoryId;
	private String name;
	private Set<Book> books = new HashSet<Book>(0);

	public Category() {
	}

	public Category(String name) {
		this.name = name;
	}

	public Category(String name, Set<Book> books) {
	this.name = name;
	this.books = books;
}
	
//	public Category( int categoryId, String name) {
//		this.name = name;
//	}
//	
//	public Category(int categoryId, String name, Set<Book> books) {
//		this.categoryId = categoryId;
//		this.name = name;
//		this.books = books;
//	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "category_id", unique = true, nullable = false)
	public int getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	@Column(name = "name", nullable = false, length = 30)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@OneToMany(mappedBy = "category", cascade = CascadeType.MERGE)
	public Set<Book> getBooks() {
		return this.books;
	}

	public void setBooks(Set<Book> books) {
		this.books = books;
	}

}
