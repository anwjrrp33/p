package org.zerock.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Criteria {
	
	private int page;
	
	private String keyword;
	
	private String type;
	
	private String[] arr;
	
	public String[] getArr(){
		
		String[] types = this.type.split("");
		
		return types;
	}
	
	public Criteria() {
		this.page = 1;
	}
	
	public Criteria(int page) {
		this.page = page;
	}
	
	public int getSkip() {
		return (this.page - 1) * 10;
	}
	
}
