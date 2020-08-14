package com.bookstore.dao;

import static org.junit.Assert.*;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.Category;

public class BookDAOTest extends BaseDAOTest {

	private static BookDAO bookDao;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		BaseDAOTest.setUpBeforeClass();
		bookDao = new BookDAO(entityManager);
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		BaseDAOTest.tearDownAfterClass();
	}

	@Test
	public void testUpdateBook() throws ParseException, IOException {
		Book existBook = new Book();
		existBook.setBookId(39);
		Category category = new Category("Advance Java");
		category.setCategoryId(27);
		existBook.setCategory(category);
		
/*1*/	existBook.setTitle("Java 8 in Action: Lambdas, Streams, and functional-style programming");
/*2*/	existBook.setAuthor("Raoul-Gabriel Urma, Mario Fusco, Alan Mycroft");
/*3*/	existBook.setDescription("Java 8 in Action is a clearly written guide to the new features of Java 8. The book covers lambdas, streams, and functional-style programming. With Java 8's functional features you can now write more concise code in less time, and also automatically benefit from multicore architectures. It's time to dig in!");
/*4*/	existBook.setPrice(36.72f);
/*5*/	existBook.setIsbn("1617291994");
		
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		
		Date publishDate = dateFormat.parse("08/28/2014");
/*6*/	existBook.setPublishDate(publishDate);
		
		String imagePath = "/home/faiz/Downloads/dummy-data-books/books/Java8inAction.jpg";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		existBook.setImage(imageBytes);
		
		Book updateBook = bookDao.update(existBook);
		
		assertEquals(updateBook.getTitle(), "Java 8 in Action: Lambdas, Streams, and functional-style programming");
	}

	
	@Test
	public void testCreateBook() throws ParseException, IOException {
		Book newBook = new Book();
		
		Category category = new Category("Java Basic");
		category.setCategoryId(13);
		newBook.setCategory(category);
		
/*1*/	newBook.setTitle("Effective Java (2nd Edition)");
/*2*/	newBook.setAuthor("Joshua Bloch");
/*3*/	newBook.setDescription("Are you looking for a deeper understanding of the Java programming language so that you can write code that is clearer, more correct, more robust, and more reusable? Look no further! Effective Java, Second Edition, brings together seventy-eight indispensable programmers rules of thumb: working, best-practice solutions for the programming challenges you encounter every day.");
/*4*/	newBook.setPrice(38.87f);
/*5*/	newBook.setIsbn("0321356683");
		
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		
		Date publishDate = dateFormat.parse("05/28/2008");
/*6*/	newBook.setPublishDate(publishDate);
		
		String imagePath = "/home/faiz/Downloads/dummy-data-books/books/EffectiveJava.jpg";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		newBook.setImage(imageBytes);
		
		Book createBook = bookDao.create(newBook);
		
		assertTrue(createBook.getBookId() > 0);
	}

}
