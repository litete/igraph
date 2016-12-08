package com.ctbri.JWLetter.pojo;

import java.io.Serializable;

public class Status implements Serializable {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2246918676071450756L;
	private int id;
	private int letter_id;
	private int ifRead;
	private int priority;
	private int status;
	public int getId() {
		return id;
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
	public int getIfRead() {
		return ifRead;
	}
	public void setIfRead(int ifRead) {
		this.ifRead = ifRead;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	

}
