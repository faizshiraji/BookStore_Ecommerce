package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Category;

public class CategoryServices {
	private EntityManager entityManager;

	private CategoryDAO categoryDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;

	public CategoryServices(EntityManager entityManager, 
			HttpServletRequest request, HttpServletResponse response) {

		this.request = request;
		this.response = response;
		this.entityManager = entityManager;

		categoryDAO = new CategoryDAO(entityManager);
	}

	public void listCategory() throws ServletException, IOException {
		List<Category> listCategory = categoryDAO.listAll();
		
 		request.setAttribute("listCategory", listCategory);

		String listPage = "category_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);

		requestDispatcher.forward(request, response);

	}

}
