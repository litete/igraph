package com.ctbri.JWLetter.pojo;

public class Links {
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public Long getWeight() {
		return weight;
	}
	public void setWeight(Long weight) {
		this.weight = weight;
	}
	public Double getF() {
		return f;
	}
	public void setF(Double f) {
		this.f = f;
	}
	private String source;
	private String target;
	private Long weight;
	private Double f;
}
