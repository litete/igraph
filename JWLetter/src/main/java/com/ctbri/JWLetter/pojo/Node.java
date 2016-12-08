package com.ctbri.JWLetter.pojo;

public class Node {
	private String name;
	private Integer category;
	private Integer value;
	private String label;

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getCategory() {
		return category;
	}

	public void setCategory(Integer category){
		this.category=category;
	}	
	
	public void setCategory(String category) {
		if(category==null||category.equals("")){
			return;
		}
		if(category.equals("person")){
			this.category = 1;
		}else if(category.equals("location")){
			this.category = 2;
		}else if(category.equals("institution")){
			this.category = 3;
		}else if(category.equals("crime")){
			this.category = 4;
		}else if(category.equals("position")){
			this.category = 5;
		}else if(category.equals("accusationdate")){
			this.category = 6;
		}else {
			this.category = 7;
		}
		
	}

	public Integer getValue() {
		return value;
	}

	public void setValue(Integer value) {
		this.value = value;
	}
}
