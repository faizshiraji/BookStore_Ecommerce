package com.bookstore.entity;
// Generated Jul 30, 2020, 12:09:47 AM by Hibernate Tools 5.2.12.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 * Users generated by hbm2java
 */
@SuppressWarnings("serial")
@Entity
@NamedQueries({
			@NamedQuery(name="Users.findAll", query = "SELECT u FROM Users u ORDER BY u.fullName"),
			@NamedQuery(name="Users.findByEmail", query = "SELECT u FROM Users u WHERE u.email = :email"),
			@NamedQuery(name = "Users.countAll", query = "SELECT Count(u.fullName) FROM Users u")
})
@Table(name = "users", catalog = "bookstoredb")
public class Users implements java.io.Serializable {

	private int userId;
	private String email;
	private String password;
	private String fullName;

	public Users() {
	}

	public Users(Integer userId, String email, String password, String fullName) {
		this(email, fullName, password);
		this.userId = userId;
	}
	
	public Users(String email, String password, String fullName) {
		super();
		this.email = email;
		this.password = password;
		this.fullName = fullName;
	}
//
//	public Users(int userId, String email, String password, String fullName) {
//		this.userId = userId;
//		this.email = email;
//		this.password = password;
//		this.fullName = fullName;
//	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_id", unique = true, nullable = false)
	public int getUserId() {
		return this.userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Column(name = "email", nullable = false, length = 30)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "password", nullable = false, length = 16)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "full_name", nullable = false, length = 30)
	public String getFullName() {
		return this.fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

}
