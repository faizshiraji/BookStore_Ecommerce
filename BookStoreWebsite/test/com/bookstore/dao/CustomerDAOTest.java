package com.bookstore.dao;

import static org.junit.Assert.*;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Customer;

public class CustomerDAOTest {
	private static CustomerDAO customerDao;
	
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		customerDao = new CustomerDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		customerDao.close();
	}

	@Test
	public void testCreateCustomer() throws ParseException, IOException{
		Customer customer = new Customer();
		
		customer.setEmail("kuddus2@gmail.com");
		customer.setFirstname("Abul");
		customer.setLastname("Kuddus");
		customer.setCity("New York");
		customer.setState("Dhaka");
		customer.setCountry("United States");
		customer.setAddressLine1("100 North Avenue");
		customer.setAddressLine2("Line 2");
		customer.setPassword("secret");
		customer.setPhone("11888281881");
		customer.setZipcode("121999");
		
		Customer savedCustomer = customerDao.create(customer);
		
		assertTrue(savedCustomer.getCustomerId() > 0);
	}

	@Test
	public void testGet() {
		Integer customerId = 23;
		Customer customer = customerDao.get(customerId);
		
		assertNotNull(customer);
	}

	@Test
	public void testUpdateCustomer() {
		Customer customer = customerDao.get(23);
		String firstname = "Tom";
		customer.setFirstname(firstname);
		
		Customer updatedCustomer =  customerDao.update(customer);
		
		assertTrue(updatedCustomer.getFirstname().equals(firstname));
//		assertTrue(updatedCustomer.getLastname().equals(lastname));
	}
	
	@Test
	public void testDeleteObject() {

		Integer customerId = 23;
		customerDao.delete(customerId);
		Customer customer = customerDao.get(customerId);
		
		assertNull(customer);
		
	}
	
	@Test
	public void testListAll() {
		List<Customer> listCustomers = customerDao.listAll();
		
		for (Customer customer : listCustomers) {
			System.out.println(customer.getFirstname());
		}
		assertFalse(listCustomers.isEmpty());
	}

	@Test
	public void testCount() {
		long count = customerDao.count();
		
		assertEquals(8, count);
	}
	
	@Test
	public void testFindByEmail() {
		String email = "kuddus@gmail.com";
		Customer customer = customerDao.findByEmail(email);
		
		assertNotNull(customer);
	}
	
	@Test
	public void testCheckLoginSuccess() {
		String email = "abulhashem@gmail.com";
		String password = "shiraji";
		
		Customer customer = customerDao.checkLogin(email, password);
		
		assertNotNull(customer);
	}
	
	@Test
	public void testCheckLoginFail() {
		String email = "abulhash@gmail.com";
		String password = "shiraji";
		
		Customer customer = customerDao.checkLogin(email, password);
		
		assertNull(customer);
	}
}
