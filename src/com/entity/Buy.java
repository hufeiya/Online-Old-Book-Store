package com.entity;

/**
 * Buy entity. @author MyEclipse Persistence Tools
 */
public class Buy extends AbstractBuy implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Buy() {
	}

	/** minimal constructor */
	public Buy(String id) {
		super(id);
	}

	/** full constructor */
	public Buy(String id, Product product, Users users, String bstate,
			String bdate) {
		super(id, product, users, bstate, bdate);
	}

}
