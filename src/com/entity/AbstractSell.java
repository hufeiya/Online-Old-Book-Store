package com.entity;

/**
 * AbstractSell entity provides the base persistence definition of the Sell
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractSell implements java.io.Serializable {

	// Fields

	private String id;
	private Product product;
	private Users users;
	private String sstate;
	private String sdate;

	// Constructors

	/** default constructor */
	public AbstractSell() {
	}

	/** minimal constructor */
	public AbstractSell(String id) {
		this.id = id;
	}

	/** full constructor */
	public AbstractSell(String id, Product product, Users users, String sstate,
			String sdate) {
		this.id = id;
		this.product = product;
		this.users = users;
		this.sstate = sstate;
		this.sdate = sdate;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public String getSstate() {
		return this.sstate;
	}

	public void setSstate(String sstate) {
		this.sstate = sstate;
	}

	public String getSdate() {
		return this.sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

}