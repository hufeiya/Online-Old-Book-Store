package com.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * AbstractUsers entity provides the base persistence definition of the Users
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractUsers implements java.io.Serializable {

	// Fields

	private String uno;
	private String uname;
	private String upass;
	private Set administrators = new HashSet(0);
	private Set buies = new HashSet(0);
	private Set sells = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractUsers() {
	}

	/** minimal constructor */
	public AbstractUsers(String uno, String uname, String upass) {
		this.uno = uno;
		this.uname = uname;
		this.upass = upass;
	}

	/** full constructor */
	public AbstractUsers(String uno, String uname, String upass,
			Set administrators, Set buies, Set sells) {
		this.uno = uno;
		this.uname = uname;
		this.upass = upass;
		this.administrators = administrators;
		this.buies = buies;
		this.sells = sells;
	}

	// Property accessors

	public String getUno() {
		return this.uno;
	}

	public void setUno(String uno) {
		this.uno = uno;
	}

	public String getUname() {
		return this.uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpass() {
		return this.upass;
	}

	public void setUpass(String upass) {
		this.upass = upass;
	}

	public Set getAdministrators() {
		return this.administrators;
	}

	public void setAdministrators(Set administrators) {
		this.administrators = administrators;
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