package com.entity;

import java.util.Set;

/**
 * Users entity. @author MyEclipse Persistence Tools
 */
public class Users extends AbstractUsers implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Users() {
	}

	/** minimal constructor */
	public Users(String uno, String uname, String upass) {
		super(uno, uname, upass);
	}

	/** full constructor */
	public Users(String uno, String uname, String upass, Set administrators,
			Set buies, Set sells) {
		super(uno, uname, upass, administrators, buies, sells);
	}

}
