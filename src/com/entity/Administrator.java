package com.entity;

import java.util.Set;

/**
 * Administrator entity. @author MyEclipse Persistence Tools
 */
public class Administrator extends AbstractAdministrator implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public Administrator() {
	}

	/** minimal constructor */
	public Administrator(String ano, String aname, String apass) {
		super(ano, aname, apass);
	}

	/** full constructor */
	public Administrator(String ano, String aname, String apass, Set userses) {
		super(ano, aname, apass, userses);
	}

}
