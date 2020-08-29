package com.bookstore.controller.frontend.shopingcart;

import static org.junit.Assert.*;

import java.util.Map;

import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;

public class ShopingCartTest {

	private static ShopingCart cart;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		cart = new ShopingCart();
		Book book = new Book(39);
		book.setPrice(10);
		
		cart.addItem(book);
		cart.addItem(book);
		
	}
	
	@Test
	public void testAddItem() {
				
		Map<Book, Integer> items = cart.getItems();
		int quntity = items.get(new Book(39));
		
		System.out.println(cart);
		
		assertEquals(2, quntity);
	}
	
	@Test
	public void testRemoveItem() {
		Book book2 = new Book(2);
		cart.addItem(book2);
		
		cart.removeItem(new Book (2));
		
		assertNull(cart.getItems().get(book2));
	}
	
	@Test
	public void testGetTotalQuantity() {
		Book book = new Book(39);
		cart.addItem(book);
		cart.addItem(book);
		cart.addItem(book);
		
		assertEquals(5, cart.getTotalQuantity());
	}
	
	@Test
	public void testGetTotalAmount1() {
		ShopingCart cart = new ShopingCart();
		assertEquals(0.0f, cart.getTotalAmount(), 0.0f);
	}
	
	@Test
	public void testGetTotalAmount2() {
		assertEquals(20.0f, cart.getTotalAmount(), 0.0f);
	}
	
	@Test
	public void testClear() {
		cart.clear();
		
		assertEquals(0.0f, cart.getTotalAmount(), 0.0f);
	}
	
	@Test
	public void testUpdateCart() {
		ShopingCart cart = new ShopingCart();
		Book book1 = new Book(1);
		Book book2 = new Book(2);
		
		cart.addItem(book1);
		cart.addItem(book2);
		
		int[] bookIds = {1, 2};
		int[] quantities = {3, 4};
		
		cart.updateCart(bookIds, quantities);
		
		assertEquals(7, cart.getTotalQuantity());
	}
}
