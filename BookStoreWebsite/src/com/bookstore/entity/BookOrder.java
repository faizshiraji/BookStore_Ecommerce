package com.bookstore.entity;
// Generated Jul 30, 2020, 12:09:47 AM by Hibernate Tools 5.2.12.Final

import java.util.Date;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

/**
 * BookOrder generated by hbm2java
 */
@Entity
@Table(name = "book_order", catalog = "bookstoredb")
@NamedQueries({
	@NamedQuery(name = "BookOrder.findAll", query = "SELECT bo FROM BookOrder bo ORDER BY bo.orderDate DESC"),
	@NamedQuery(name = "BookOrder.countAll", query = "SELECT COUNT(*) FROM BookOrder"),
	@NamedQuery(name = "BookOrder.findByCustomer", query = "SELECT bo FROM BookOrder bo WHERE bo.customer.customerId =:customerId ORDER BY bo.orderDate DESC"),
	@NamedQuery(name = "BookOrder.findByIdAndCustomer", query = "SELECT bo FROM BookOrder bo WHERE bo.orderId =:orderId AND bo.customer.customerId =:customerId")
	
})
public class BookOrder implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int orderId;
	private Customer customer;
	private Date orderDate;
	private String addressLine1;
	private String addressLine2;
	private String firstname;
	private String lastname;
	private String phone;
	private String country;
	private String state;
	private String city;
	private String zipcode;
	private String paymentMethod;
	private float shippingFee;
	private float tax;
	private float subtotal;
	private float total;
	private String status;
	private Set<OrderDetail> orderDetails = new HashSet<OrderDetail>(0);

	public BookOrder() {
	}

	public BookOrder(int orderId, Customer customer, Date orderDate, String addressLine1, String addressLine2, String firstname, String lastname,
			String phone, String country, String state, String city, String zipcode, String paymentMethod, float shippingFee, float tax, float subtotal, float total, String status) {
		this.orderId = orderId;
		this.customer = customer;
		this.orderDate = orderDate;
		this.addressLine1 = addressLine1;
		this.addressLine2 = addressLine2;
		this.firstname = firstname;
		this.lastname = lastname;
		this.phone = phone;
		this.country = country;
		this.state = state;
		this.city = city;
		this.zipcode = zipcode;
		this.paymentMethod = paymentMethod;
		this.shippingFee = shippingFee;
		this.tax = tax;
		this.subtotal = subtotal;
		this.total = total;
		this.status = status;
	}

	public BookOrder(int orderId, Customer customer, Date orderDate, String addressLine1, String addressLine2, String firstname, String lastname,
			String phone, String country, String state, String city, String zipcode, String paymentMethod, float shippingFee, float tax, float subtotal, float total, String status, Set<OrderDetail> orderDetails) {
		this.orderId = orderId;
		this.customer = customer;
		this.orderDate = orderDate;
		this.addressLine1 = addressLine1;
		this.addressLine2 = addressLine2;
		this.firstname = firstname;
		this.lastname = lastname;
		this.phone = phone;
		this.country = country;
		this.state = state;
		this.city = city;
		this.zipcode = zipcode;
		this.paymentMethod = paymentMethod;
		this.shippingFee = shippingFee;
		this.tax = tax;
		this.subtotal = subtotal;
		this.total = total;
		this.status = status;
		this.orderDetails = orderDetails;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "order_id", unique = true, nullable = false)
	public int getOrderId() {
		return this.orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "customer_id", nullable = false)
	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "order_date", nullable = false, length = 19)
	public Date getOrderDate() {
		return this.orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	@Column(name = "r_address_line1", nullable = false, length = 256)
	public String getAddressLine1() {
		return this.addressLine1;
	}

	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}

	@Column(name = "r_address_line2", length = 256)
	public String getAddressLine2() {
		return addressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}

	@Column(name = "r_firstname", nullable = false, length = 30)
	public String getFirstname() {
		return this.firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	@Column(name = "r_lastname", nullable = false, length = 30)
	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	
	@Column(name = "r_phone", length = 15)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "r_country", nullable = false, length = 4)
	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}
	
	@Transient
	public String getCountryName() {
		return new Locale("", this.country).getDisplayCountry();
	}
	
	@Column(name = "r_state", nullable = false, length = 45)
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Column(name = "r_city", nullable = false, length = 45)
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	
	@Column(name = "r_zipcode", nullable = false, length = 45)
	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	
	@Column(name = "payment_method", nullable = false, length = 20)
	public String getPaymentMethod() {
		return this.paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	@Column(name = "shipping_fee", nullable = false, precision = 12, scale = 0)
	public float getShippingFee() {
		return shippingFee;
	}

	public void setShippingFee(float shippingFee) {
		this.shippingFee = shippingFee;
	}
	
	@Column(name = "tax", nullable = false, precision = 12, scale = 0)
	public float getTax() {
		return tax;
	}

	public void setTax(float tax) {
		this.tax = tax;
	}

	@Column(name = "subtotal", nullable = false, precision = 12, scale = 0)
	public float getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(float subtotal) {
		this.subtotal = subtotal;
	}
	
	@Column(name = "total", nullable = false, precision = 12, scale = 0)
	public float getTotal() {
		return this.total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	@Column(name = "status", nullable = false, length = 20)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "bookOrder", cascade = CascadeType.ALL, orphanRemoval = true)
	public Set<OrderDetail> getOrderDetails() {
		return this.orderDetails;
	}

	public void setOrderDetails(Set<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}
	
	@Transient
	public int getBookCopies() {
		int total = 0;
		
		for (OrderDetail orderDetail : orderDetails) {
			total += orderDetail.getQuantity();
		}
		
		return total;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + orderId;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BookOrder other = (BookOrder) obj;
		if (orderId != other.orderId)
			return false;
		return true;
	}

	

}
