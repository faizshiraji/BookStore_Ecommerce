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
		
		customer.setEmail("kuddus@gmail.com");
		customer.setFullname("Abdul Kuddus");
		customer.setCity("New York");
		customer.setCountry("United States");
		customer.setAddress("100 North Avenue");
		customer.setPassword("secret");
		customer.setPhone("11888281881");
		customer.setZipcode("121999");
		
		Customer savedCustomer = customerDao.create(customer);
		
		assertTrue(savedCustomer.getCustomerId() > 0);
	}

	@Test
	public void testGet() {
		Integer customerId = 14;
		Customer customer = customerDao.get(customerId);
		
		assertNotNull(customer);
	}

	@Test
	public void testUpdateCustomer() {
		Customer customer = customerDao.get(14);
		String fullName = "Tom n Jerry";
		customer.setFullname(fullName);
		
		Customer updatedCustomer =  customerDao.update(customer);
		
		assertTrue(updatedCustomer.getFullname().equals(fullName));
	}
	
	@Test
	public void testDeleteObject() {

		Integer customerId = 14;
		customerDao.delete(customerId);
		Customer customer = customerDao.get(customerId);
		
		assertNull(customer);
		
	}
	
	@Test
	public void testListAll() {
		List<Customer> listCustomers = customerDao.listAll();
		assertFalse(listCustomers.isEmpty());
	}

	@Test
	public void testCount() {
		long count = customerDao.count();
		
		assertEquals(1, count);
	}
	
	@Test
	public void testFindByEmail() {
		String email = "kuddus@gmail.com";
		Customer customer = customerDao.findByEmail(email);
		
		assertNotNull(customer);
	}
}
