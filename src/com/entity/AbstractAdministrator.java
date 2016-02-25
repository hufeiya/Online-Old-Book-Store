package com.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * AbstractAdministrator entity provides the base persistence definition of the
 * Administrator entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractAdministrator implements java.io.Serializable {

	// Fields

	private String ano;
	private String aname;
	private String apass;
	private Set userses = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractAdministrator() {
	}

	/** minimal constructor */
	public AbstractAdministrator(String ano, String aname, String apass) {
		this.ano = ano;
		this.aname = aname;
		this.apass = apass;
	}

	/** full constructor */
	public AbstractAdministrator(String ano, String aname, String apass,
			Set userses) {
		this.ano = ano;
		this.aname = aname;
		this.apass = apass;
		this.userses = userses;
	}

	// Property accessors

	public String getAno() {
		return this.ano;
	}

	public void setAno(String ano) {
		this.ano = ano;
	}

	public String getAname() {
		return this.aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getApass() {
		return this.apass;
	}

	public void setApass(String apass) {
		this.apass = apass;
	}

	public Set getUserses() {
		return this.userses;
	}

	public void setUserses(Set userses) {
		this.userses = userses;
	}

}