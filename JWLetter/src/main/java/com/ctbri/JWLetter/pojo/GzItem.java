package com.ctbri.JWLetter.pojo;

import java.io.Serializable;

public class GzItem implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5302245442836648937L;
	private String name;
	private Long count;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getCount() {
		return count;
	}
	public void setCount(Long count) {
		this.count = count;
	}
}
