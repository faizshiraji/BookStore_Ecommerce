package com.bookstore.controller.admin.book;

import com.bookstore.controller.BaseServlet;
import com.bookstore.service.BookServices;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig(
		fileSizeThreshold = 1024 * 10, // 10 KB
		maxFileSize = 1024 * 300, // 300 KB
		maxRequestSize = 1024 * 1024 // 1MB
		)
@WebServlet("/admin/update_book")
public class UpdateBookServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	public UpdateBookServlet() {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BookServices bookServices = new BookServices(entityManager, request, response);
		bookServices.updateBook();
	}

}
