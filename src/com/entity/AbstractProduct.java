package com.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * AbstractProduct entity provides the base persistence definition of the
 * Product entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractProduct implements java.io.Serializable {

	// Fields

	private String pno;
	private String pname;
	private String pbrand;
	private Float pprice;
	private String pphoto;
	private String pproducer;
	private String pdate;
	private String pintroducer;
	private String ptype;
	private Set buies = new HashSet(0);
	private Set sells = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractProduct() {
	}

	/** minimal constructor */
	public AbstractProduct(String pno, String pname) {
		this.pno = pno;
		this.pname = pname;
	}

	/** full constructor */
	public AbstractProduct(String pno, String pname, String pbrand,
			Float pprice, String pphoto, String pproducer, String pdate,
			String pintroducer, String ptype, Set buies, Set sells) {
		this.pno = pno;
		this.pname = pname;
		this.pbrand = pbrand;
		this.pprice = pprice;
		this.pphoto = pphoto;
		this.pproducer = pproducer;
		this.pdate = pdate;
		this.pintroducer = pintroducer;
		this.ptype = ptype;
		this.buies = buies;
		this.sells = sells;
	}

	// Property accessors

	public String getPno() {
		return this.pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
	}

	public String getPname() {
		return this.pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPbrand() {
		return this.pbrand;
	}

	public void setPbrand(String pbrand) {
		this.pbrand = pbrand;
	}

	public Float getPprice() {
		return this.pprice;
	}

	public void setPprice(Float pprice) {
		this.pprice = pprice;
	}

	public String getPphoto() {
		return this.pphoto;
	}

	public void setPphoto(String pphoto) {
		this.pphoto = pphoto;
	}

	public String getPproducer() {
		return this.pproducer;
	}

	public void setPproducer(String pproducer) {
		this.pproducer = pproducer;
	}

	public String getPdate() {
		return this.pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	public String getPintroducer() {
		return this.pintroducer;
	}

	public void setPintroducer(String pintroducer) {
		this.pintroducer = pintroducer;
	}

	public String getPtype() {
		return this.ptype;
	}

	public void setPtype(String ptype) {
		this.ptype = ptype;
	}

	public Set getBuies() {
		return this.buies;
	}

	public void setBuies(Set buies) {
		this.buies = buies;
	}

	public Set getSells() {
		return this.sells;
	}

	public void setSells(Set sells) {
		this.sells = sells;
	}

}