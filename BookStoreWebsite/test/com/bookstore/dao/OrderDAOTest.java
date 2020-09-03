package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.BookOrder;
import com.bookstore.entity.Customer;
import com.bookstore.entity.OrderDetail;

public class OrderDAOTest {

	private static OrderDAO orderDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		orderDAO = new OrderDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		orderDAO.close();
	}

	@Test
	public void testCreateBookOrder() {
		BookOrder order = new BookOrder();
		Customer customer = new Customer();
		customer.setCustomerId(15);

		order.setCustomer(customer);
		order.setRecipientName("Md. Faiz");
		order.setRecipientPhone("01700000000");
		order.setShippingAddress("333, West Rampura, Rampura, Dhaka, Bangladesh");

		Set<OrderDetail> orderDetails = new HashSet<>();
		OrderDetail orderDetail = new OrderDetail();

		Book book = new Book(41);
		orderDetail.setBook(book);
		orderDetail.setQuantity(2);
		orderDetail.setSubtotal(60.5f);
		orderDetail.setBookOrder(order);

		orderDetails.add(orderDetail);

		order.setOrderDetails(orderDetails);

		orderDAO.create(order);

		assertTrue(order.getOrderId() > 0);
	}

	@Test
	public void testCreateBookOrder2() {
		BookOrder order = new BookOrder();
		Customer customer = new Customer();
		customer.setCustomerId(19);

		order.setCustomer(customer);
		order.setRecipientName("Md. Faiz");
		order.setRecipientPhone("01700000000");
		order.setShippingAddress("333, West Rampura, Rampura, Dhaka, Bangladesh");

		Set<OrderDetail> orderDetails = new HashSet<>();

		Book book1 = new Book(41);
		OrderDetail orderDetail1 = new OrderDetail();
		orderDetail1.setBook(book1);
		orderDetail1.setQuantity(2);
		orderDetail1.setSubtotal(60.5f);
		orderDetail1.setBookOrder(order);

		orderDetails.add(orderDetail1);

		Book book2 = new Book(42);
		OrderDetail orderDetail2 = new OrderDetail();
		orderDetail2.setBook(book2);
		orderDetail2.setQuantity(1);
		orderDetail2.setSubtotal(25f);
		orderDetail2.setBookOrder(order);

		orderDetails.add(orderDetail2);

		order.setOrderDetails(orderDetails);

		orderDAO.create(order);

		assertTrue(order.getOrderId() > 0 && order.getOrderDetails().size() == 2);
	}

	@Test
	public void testUpdateBookOrderShippingAddress() {
		Integer orderId = 27;
		BookOrder order = orderDAO.get(orderId);
		order.setShippingAddress("New Shipping Address");
		
		orderDAO.update(order);
		
		BookOrder updateOrder = orderDAO.get(orderId);
		
		assertEquals(order.getShippingAddress(), updateOrder.getShippingAddress());
		
	}

	@Test
	public void testUpdateBookBookOrderDetail() {
		Integer orderId = 28;
		BookOrder order = orderDAO.get(orderId);
		
		Iterator<OrderDetail> iterator = order.getOrderDetails().iterator();
		
		while (iterator.hasNext()) {
			OrderDetail orderDetail = iterator.next();
			if (orderDetail.getBook().getBookId()==41) {
				orderDetail.setQuantity(3);
				orderDetail.setSubtotal(120);
			}
			
		}
		
		orderDAO.update(order);
		
		BookOrder updateOrder = orderDAO.get(orderId);

		iterator = order.getOrderDetails().iterator();
		
		int expectedQuantity = 3;
		float expectedSubtotal = 120;
		int actualQuantity = 0;
		float actualSubtotal = 0;
		
		while (iterator.hasNext()) {
			OrderDetail	orderDetail = iterator.next();
			if (orderDetail.getBook().getBookId()==41) {
				actualQuantity = orderDetail.getQuantity();
				actualSubtotal = orderDetail.getSubtotal();
			}
		}
		
		assertEquals(expectedQuantity, actualQuantity);
		assertEquals(expectedSubtotal, actualSubtotal, 0.0f);
		
	}

	
	@Test
	public void testGet() {
		Integer orderId = 28;
		BookOrder order = orderDAO.get(orderId);
		System.out.println(order.getRecipientName());
		System.out.println(order.getRecipientPhone());
		System.out.println(order.getShippingAddress());
		System.out.println(order.getStatus());
		System.out.println(order.getTotal());
		System.out.println(order.getPaymentMethod());

		assertEquals(2, order.getOrderDetails().size());
	}

	@Test
	public void testGetByIdAndCustomerNull() {
		Integer orderId = 33;
		Integer customerId = 18;
		
		BookOrder order = orderDAO.get(orderId, customerId);
		
		assertNull(order);
		
	}
	
	@Test
	public void testDeleteOrder() {
		int orderId = 27;
		orderDAO.delete(orderId);
		BookOrder order = orderDAO.get(orderId);
		
		assertNull(order);
	}

	@Test
	public void testListAll() {
		List<BookOrder> listOrders = orderDAO.listAll();

		for (BookOrder order : listOrders) {
			System.out.println(order.getOrderId()
					+ " - " + order.getCustomer().getFullname() 
					+ " - " + order.getTotal()
					+ " - " + order.getStatus());

		for (OrderDetail detail : order.getOrderDetails()) {
			Book book = detail.getBook();
			int quantity = detail.getQuantity();
			float subtotal = detail.getSubtotal();
			System.out.println("\t" + book.getTitle() + " - " + quantity + " - " + subtotal);
		}
		}
		assertTrue(listOrders.size() > 0);
	}

	@Test
	public void testListByCustomerNoOrders() {
		Integer customerId = 20;
		List<BookOrder> listOrders = orderDAO.listByCustomer(customerId);
		
		assertTrue(listOrders.isEmpty());
	}
	
	@Test
	public void testListByCustomerHaveOrders() {
		Integer customerId = 18;
		List<BookOrder> listOrders = orderDAO.listByCustomer(customerId);
		
		assertTrue(listOrders.size()>0);
	}
	
	@Test
	public void testCount() {
		long totalOrders = orderDAO.count();
		assertEquals(2, totalOrders);
	}

}
