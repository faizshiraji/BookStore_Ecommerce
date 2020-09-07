package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.persistence.PersistenceException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Users;

public class UserDAOTest {
	private static UserDAO userDAO;
	
	@BeforeClass
	public static void setUpClass() throws Exception {
		userDAO = new UserDAO();
	}

	@Test
	public void testCreateUsers() {
		Users user1 = new Users();
		user1.setEmail("anisul.islam@cloudwell.co");
		user1.setFullName("Anisul Islam");
		user1.setPassword("anisul123");

		user1 = userDAO.create(user1);
		
		assertTrue(user1.getUserId() > 0);
	}
	
	@Test(expected = PersistenceException.class)
	public void testCreateUsersFieldsNotSet() {
		Users user1 = new Users();
		user1 = userDAO.create(user1);
		
	}
	
	@Test
	public void testUpdateUsers() {

		Users user = new Users();
		user.setUserId(19);
		user.setEmail("numan123@gmail.com");
		user.setFullName("Full Name");
		user.setPassword("123456");
		
		user = userDAO.update(user);
		String expected = "123456";
		String actual = user.getPassword();
		
		assertEquals(expected, actual);
		
	}

	@Test
	public void testGetUsersFound() {
		Integer userId = 19;
		Users user = userDAO.get(userId);

		if (user!=null) {
			System.out.println(user.getEmail());			
		}

		assertNotNull(user);
	}
	
	@Test
	public void testGetUsersNotFound() {
		Integer userId = 99;
		Users user = userDAO.get(userId);
		
		assertNull(user);
	}
	
	@Test
	public void testDeleteUsers() {
		Integer userId = 19;
		userDAO.delete(userId);
		
		Users user = userDAO.get(userId);
		
		assertNull(user);
	}
	
	@Test(expected = Exception.class)
	public void testDeleteNonExistUsers() {
		Integer userId = 55;
		userDAO.delete(userId);
	}
	
	@Test
	public void testListAll() {
		List<Users> listUsers = userDAO.listAll();
		
		for (Users user : listUsers) {
			System.out.println(user.getEmail());
		}
		
		assertTrue(listUsers.size() > 0);
	}

	@Test
	public void testCheckLoginSuccess() {
		String email = "faiz@shiraji.me";
		String password = "Faiz";
		boolean loginResult = userDAO.checkLogin(email, password);
		
		assertTrue(loginResult);
	}
	
	@Test
	public void testCheckLoginFail() {
		String email = "faiz@shiraji.me";
		String password = "Faiz1";
		boolean loginResult = userDAO.checkLogin(email, password);
		
		assertFalse(loginResult);
	}
	
	@Test
	public void testCount() {
		long totalUsers = userDAO.count();
		
		assertTrue(totalUsers > 0);
	}
	
	@Test
	public void testFindByEmail() {
		String email = "faiz@shiraji.me";
		Users user = userDAO.findByEmail(email);
		
		assertNotNull(user);
	}
	
	
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		userDAO.close();
	}
	
}
