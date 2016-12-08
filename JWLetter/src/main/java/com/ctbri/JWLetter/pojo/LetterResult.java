package com.ctbri.JWLetter.pojo;

import java.io.Serializable;

public class LetterResult implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2652924509083598527L;
	/**
	 * 
	 */
	private int id;
	private int letter_id;
	private long submitDateTime;
	private String author;
	private String contents;
	private String attachments;
	public int getName() {
		return name;
	}
	public void setName(int name) {
		this.name = name;
	}
	public int getIfRead() {
		return ifRead;
	}
	public void setIfRead(int ifRead) {
		this.ifRead = ifRead;
	}
	private int name;
	private int ifRead;
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
	public long getSubmitDateTime() {
		return submitDateTime;
	}
	public void setSubmitDateTime(long submitDateTime) {
		this.submitDateTime = submitDateTime;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getAttachments() {
		return attachments;
	}
	public void setAttachments(String attachments) {
		this.attachments = attachments;
	}

}
