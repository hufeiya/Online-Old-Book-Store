package com.entity;

/**
 * Sell entity. @author MyEclipse Persistence Tools
 */
public class Sell extends AbstractSell implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Sell() {
	}

	/** minimal constructor */
	public Sell(String id) {
		super(id);
	}

	/** full constructor */
	public Sell(String id, Product product, Users users, String sstate,
			String sdate) {
		super(id, product, users, sstate, sdate);
	}

}
