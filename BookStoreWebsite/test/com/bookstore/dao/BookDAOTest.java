package com.bookstore.dao;

import static org.junit.Assert.*;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityNotFoundException;

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
		
		Category category = new Category("Advance Java");
		category.setCategoryId(27);
		newBook.setCategory(category);
		
/*1*/	newBook.setTitle("Head First Java, 2nd Edition");
/*2*/	newBook.setAuthor("Kathy Sierra, Bert Bates");
/*3*/	newBook.setDescription("Learning a complex new language is no easy task especially when it s an object-oriented computer programming language like Java. You might think the problem is your brain. It seems to have a mind of its own, a mind that doesn't always want to take in the dry, technical stuff you're forced to study.");
/*4*/	newBook.setPrice(27.33f);
/*5*/	newBook.setIsbn("0596009208");	
		
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		
		Date publishDate = dateFormat.parse("02/19/2005");
/*6*/	newBook.setPublishDate(publishDate);
		
		String imagePath = "/home/faiz/Downloads/dummy-data-books/books/HeadFirstJava.jpg";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		newBook.setImage(imageBytes);
		
		Book createBook = bookDao.create(newBook);
		
		assertTrue(createBook.getBookId() > 0);
	}

	@Test(expected = EntityNotFoundException.class)
	public void testDeleteBookFail() {
		Integer bookId = 100;
		bookDao.delete(bookId);
		
		assertTrue(true);
	}
	
	@Test
	public void testGetBookFail() {
		Integer bookId = 39;
		Book book = bookDao.get(bookId);

		assertNull(book);
	}
	
	@Test
	public void testListAll() {
		List<Book> listBooks = bookDao.listAll();
		
		for (Book aBook : listBooks) {
			System.out.println(aBook.getTitle() + " - " + aBook.getAuthor());
		}
		
		assertFalse(listBooks.isEmpty());
	}
	
	@Test
	public void testFindByTitleNotExist() {
		String title = "Thinking in Java";
		Book book = bookDao.findByTitle(title);
		
		assertNull(book);
	}
	
	@Test
	public void testFindByTitleExist() {
		String title = "Head First Java, 2nd Edition";
		Book book = bookDao.findByTitle(title);
		
		System.out.println(book.getAuthor());
		System.out.println(book.getPrice());
		
		assertNotNull(book);
	}
	
	
	@Test
	public void testGetBookSuccess() {
		Integer bookId = 39;
		Book book = bookDao.get(bookId);

		assertNotNull(book);
	}
	
	@Test
	public void testCount() {
		long totalBooks = bookDao.count();
		
		assertEquals(5, totalBooks);
	}
	
	@Test
	public void testDeleteBookSuccess() {
		Integer bookId = 40;
		bookDao.delete(bookId);
		
		assertTrue(true);
	}
	
	
}
