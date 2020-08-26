package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.CustomerDAO;
import com.bookstore.entity.Customer;

public class CustomerServices {
	private CustomerDAO customerDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;

	public CustomerServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		this.customerDAO = new CustomerDAO();
	}

	public void listCustomers(String message) throws ServletException, IOException {
		List<Customer> listCustomer = customerDAO.listAll();

		if (message != null) {
			request.setAttribute("message", message);
		}

		request.setAttribute("listCustomer", listCustomer);

		String listPage = "customer_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
	}

	public void listCustomers() throws ServletException, IOException {
		listCustomers(null);
	}

	public void createCustomer() throws ServletException, IOException {
		String email = request.getParameter("email");
		Customer existCustomer = customerDAO.findByEmail(email);

		if (existCustomer != null) {
			String message = "Could not create new customer: the email " + email
					+ " is already registered y another customer";
			listCustomers(message);
		} else {
			Customer newCustomer = new Customer();
			updateCustomerFieldFromForm(newCustomer);
			customerDAO.create(newCustomer);

			String message = "New customer has been create successfully.";
			listCustomers(message);
		}

	}
	
	private void updateCustomerFieldFromForm(Customer customer) {

		String email = request.getParameter("email");
		String fullName = request.getParameter("fullName");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String zipCode = request.getParameter("zipCode");
		String country = request.getParameter("country");

		customer.setEmail(email);
		customer.setFullname(fullName);
		customer.setPassword(password);
		customer.setPhone(phone);
		customer.setAddress(address);
		customer.setCity(city);
		customer.setZipcode(zipCode);
		customer.setCountry(country);

	}
	
	public void registerCustomer() throws ServletException, IOException {
		String email = request.getParameter("email");
		Customer existCustomer = customerDAO.findByEmail(email);

		String message = "";
		
		if (existCustomer != null) {
			message = "Could not register. The email " + email
					+ " is already registered by another customer.";
		} else {

			Customer newCustomer = new Customer();
			updateCustomerFieldFromForm(newCustomer);
			customerDAO.create(newCustomer);

			message = "You have registered successfully! Thank you. </br> " + 
			"<a href='login'>Click Here</a> to login.";

		}

		String messagePage = "frontend/message.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(messagePage);
		request.setAttribute("message", message);
		requestDispatcher.forward(request, response);
		
	}

	public void editCustomer() throws ServletException, IOException {
		Integer customerId = Integer.parseInt(request.getParameter("id"));
		Customer customer = customerDAO.get(customerId);

		request.setAttribute("customer", customer);

		String editPage = "customer_form.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);
	}

	public void updateCustomer() throws ServletException, IOException {
		int customerId = Integer.parseInt(request.getParameter("customerId"));
		String email = request.getParameter("email");

		Customer customerByEmail = customerDAO.findByEmail(email);
		String message = null;

		if (customerByEmail != null && customerByEmail.getCustomerId() != customerId) {
			message = "Could not update the customer ID " + customerId
					+ " because there's an existing customer having the same email.";

		} else {
			Customer customerById = customerDAO.get(customerId);
			updateCustomerFieldFromForm(customerById);
			
			customerDAO.update(customerById);

			message = "The customer has been updated successfully.";
		}

		listCustomers(message);
	}

	public void deleteCustomer() throws ServletException, IOException {
		
		Integer customerId = Integer.parseInt(request.getParameter("id"));
		
		customerDAO.delete(customerId);
		
		String message = "Customer has been delete successfully.";
		
		listCustomers(message);
	}

	public void showLogin() throws ServletException, IOException {
		String loginPage = "frontend/login.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(loginPage);
		dispatcher.forward(request, response);
	}

	public void doLogin() throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		Customer customer = customerDAO.checkLogin(email, password);
		
		if (customer == null) {
			String message = "Login failed. Please check your email and password.";
			request.setAttribute("message", message);
			showLogin();
		}else {
			String profile = "frontend/customer_profile.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(profile);
			dispatcher.forward(request, response);
		}
	}
}
