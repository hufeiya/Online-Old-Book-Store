package com.entity;

import java.util.Set;

/**
 * Product entity. @author MyEclipse Persistence Tools
 */
public class Product extends AbstractProduct implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Product() {
	}

	/** minimal constructor */
	public Product(String pno, String pname) {
		super(pno, pname);
	}

	/** full constructor */
	public Product(String pno, String pname, String pbrand, Float pprice,
			String pphoto, String pproducer, String pdate, String pintroducer,
			String ptype, Set buies, Set sells) {
		super(pno, pname, pbrand, pprice, pphoto, pproducer, pdate,
				pintroducer, ptype, buies, sells);
	}
	
}
