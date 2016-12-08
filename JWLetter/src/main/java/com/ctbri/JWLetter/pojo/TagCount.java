package com.ctbri.JWLetter.pojo;

import java.io.Serializable;

public class TagCount implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2279394674449844840L;
	private Integer tag_id;
	private Integer count;
	public Integer getTag_id() {
		return tag_id;
	}
	public void setTag_id(Integer tag_id) {
		this.tag_id = tag_id;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public String getTag_name() {
		return tag_name;
	}
	public void setTag_name(String tag_name) {
		this.tag_name = tag_name;
	}
	public String getTag_class() {
		return tag_class;
	}
	public void setTag_class(String tag_class) {
		this.tag_class = tag_class;
	}
	private String tag_name;
	private String tag_class;
	
}
