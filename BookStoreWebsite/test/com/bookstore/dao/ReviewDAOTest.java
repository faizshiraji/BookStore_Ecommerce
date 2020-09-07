package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.Customer;
import com.bookstore.entity.Review;

public class ReviewDAOTest {
	
	private static ReviewDAO reviewDao;
	

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		reviewDao = new ReviewDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		reviewDao.close();
	}

	@Test
	public void testCreateReview() {

		Review review = new Review();
		Book book = new Book();
		book.setBookId(42);
		
		Customer customer = new Customer();
		customer.setCustomerId(16);
		
		review.setBook(book);
		review.setCustomer(customer);
		
		review.setHeadline("This is a very good book!");
		review.setRating(4);
		review.setComment("I have just read this book. Very Good.");
		
		Review savedReview = reviewDao.create(review);
		
		assertTrue(savedReview.getReviewId() > 0);
	}

	@Test
	public void testGet() {
		Integer reviewId = 17;
		Review review = reviewDao.get(reviewId);
		
		assertNotNull(review);
	}

	@Test
	public void testUpdateReview() {
		Integer reviewId = 17;
		Review review = reviewDao.get(reviewId);
		
		review.setHeadline("Exellent Book");
		
		Review updateReview = reviewDao.update(review);
		
		assertEquals(review.getHeadline(), updateReview.getHeadline());
	}
	
	@Test
	public void testDeleteReview() {
		int reviewId = 17;
		reviewDao.delete(reviewId);
		
		Review review = reviewDao.get(reviewId);
		
		assertNull(review);
	}

	@Test
	public void testListAll() {
		List<Review> listReview = reviewDao.listAll();
		
		for (Review review : listReview) {
			System.out.println(review.getReviewId() + " - " + review.getBook().getTitle() + 
					" - " + review.getCustomer().getFirstname() + 
					" - " + review.getHeadline() + 
					" - " + review.getRating());
		}
		
		assertTrue(listReview.size() > 0);
	}

	@Test
	public void testCount() {
		long totalReviews = reviewDao.count();
		
		assertTrue(totalReviews > 0);
	}
	
	@Test
	public void testFindByCustomerAndBookNotFound() {
		Integer customerId = 100;
		Integer bookId = 99;
		
		Review result = reviewDao.findByCustomerAndBook(customerId, bookId);
		
		assertNull(result);
	}

	@Test
	public void testFindByCustomerAndBookFound() {
		Integer customerId = 20;
		Integer bookId = 39;
		
		Review result = reviewDao.findByCustomerAndBook(customerId, bookId);
		
		assertNotNull(result);
	}
	
	@Test
	public void testListMostRecent() {
		List<Review> listMostRecent = reviewDao.listMostRecent();
		
		assertEquals(3, listMostRecent.size());
	}
}
