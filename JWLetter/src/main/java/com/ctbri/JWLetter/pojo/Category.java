package com.ctbri.JWLetter.pojo;

import java.io.Serializable;

public class Category implements Serializable {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8634861886148046294L;
	private int id;
	private int letter_id;
	private int name;
	public int getId() {
		return id;
	}
	public int getName() {
		return name;
	}
	public void setName(int name) {
		this.name = name;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getLetter_id() {
		return letter_id;
	}
	public void setLetter_id(int letter_id) {
		this.letter_id = letter_id;
	}
	

}
