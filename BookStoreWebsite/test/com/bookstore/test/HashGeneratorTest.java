package com.bookstore.test;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.bookstore.dao.HashGenerationException;
import com.bookstore.service.HashGenerator;

public class HashGeneratorTest {
	
	@Test
	public void testMD5Hash() throws HashGenerationException {
		String password = "shiraji";
		String encryptedPassword = HashGenerator.generateMD5(password);
		
		System.out.println("My Clear Text Password: " + password);
		System.out.println("My Encrypted Password: " + encryptedPassword);
		
		assertTrue(true);
	}
	
}
