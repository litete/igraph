package com.ctbri.JWLetter.pojo;

import java.io.Serializable;

public class Letter implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3279333001158885713L;
	private int id;
	private int letter_id;
	private String submitDateTime;
	private String author;
	private String contents;
	private String attachments;
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
	public String getSubmitDateTime() {
		return submitDateTime;
	}
	public void setSubmitDateTime(String submitDateTime) {
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

	@Override
	public String toString() {
		return "Letter{" +
				"id=" + id +
				", letter_id=" + letter_id +
				", submitDateTime='" + submitDateTime + '\'' +
				", author='" + author + '\'' +
				", contents='" + contents + '\'' +
				", attachments='" + attachments + '\'' +
				'}';
	}
}
