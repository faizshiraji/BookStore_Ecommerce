package com.bookstore.entity;

import static org.junit.Assert.assertEquals;

import java.util.HashSet;
import java.util.Set;

import org.junit.Test;

public class BookRatingTest {

	@Test
	public void testAverageRating1() {
	Book book = new Book();
	
	Set<Review> reviews = new HashSet<>();
	Review review1 = new Review();
	review1.setRating(5);
	reviews.add(review1);
	
	book.setReviews(reviews);
	
	float averageRating = book.getAverageRating();
	
	assertEquals(5.0, averageRating, 0.0);
	}
	
	@Test
	public void testAverageRating2() {
	Book book = new Book();
		
	float averageRating = book.getAverageRating();
	
	assertEquals(0.0, averageRating, 0.0);
	
	}
	
	@Test
	public void testAverageRating3() {
	Book book = new Book();
	
	Set<Review> reviews = new HashSet<>();

	Review review1 = new Review();
	review1.setRating(5);
	reviews.add(review1);
	
	Review review2 = new Review();
	review2.setRating(4);
	reviews.add(review2);
	
	Review review3 = new Review();
	review3.setRating(3);
	reviews.add(review3);
	
	book.setReviews(reviews);
	
	float averageRating = book.getAverageRating();
	
	assertEquals(4.0, averageRating, 0.0);
	}
	
	@Test
	public void testRatingString() {
		float averageRating = 1.5f;
		Book book = new Book();
		String actual = book.getRatingString(averageRating);
		
//		String expected = "off,off,off,off,off";
		String expected = "on,half,off,off,off";
		
		assertEquals(expected, actual);
	}

}
