package com.bookstore.controller.frontend.shopingcart;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.BookDAO;
import com.bookstore.entity.Book;

@WebServlet("/add_to_cart")
public class AddBookToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddBookToCartServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer bookId = Integer.parseInt(request.getParameter("book_id"));
		Object cartOrbject = request.getSession().getAttribute("cart");
		
		ShopingCart shopingCart = null;
		
		if (cartOrbject != null && cartOrbject instanceof ShopingCart) {
			shopingCart = (ShopingCart) cartOrbject;
			
		}else {
			shopingCart = new ShopingCart();
			request.getSession().setAttribute("cart", shopingCart);
		}
		
		BookDAO bookDAO = new BookDAO();
		Book book = bookDAO.get(bookId);
		
		shopingCart.addItem(book);
		
		String cartPage = request.getContextPath().concat("/view_cart");
		response.sendRedirect(cartPage);
	}

}
