package com.entity;

/**
 * AbstractBuy entity provides the base persistence definition of the Buy
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractBuy implements java.io.Serializable {

	// Fields

	private String id;
	private Product product;
	private Users users;
	private String bstate;
	private String bdate;

	// Constructors

	/** default constructor */
	public AbstractBuy() {
	}

	/** minimal constructor */
	public AbstractBuy(String id) {
		this.id = id;
	}

	/** full constructor */
	public AbstractBuy(String id, Product product, Users users, String bstate,
			String bdate) {
		this.id = id;
		this.product = product;
		this.users = users;
		this.bstate = bstate;
		this.bdate = bdate;
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

	public String getBstate() {
		return this.bstate;
	}

	public void setBstate(String bstate) {
		this.bstate = bstate;
	}

	public String getBdate() {
		return this.bdate;
	}

	public void setBdate(String bdate) {
		this.bdate = bdate;
	}

}