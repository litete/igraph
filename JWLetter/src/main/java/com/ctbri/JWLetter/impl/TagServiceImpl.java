package com.ctbri.JWLetter.impl;

import com.ctbri.JWLetter.DAO.TagMapper;
import com.ctbri.JWLetter.pojo.Status;
import com.ctbri.JWLetter.pojo.TagCount;

public class TagServiceImpl {

	private static TagMapper tagMapper;
	
	


	public static TagMapper getStatusMapper() {
		return tagMapper;
	}




	public static void setTagMapper(TagMapper tagMapper) {
		TagServiceImpl.tagMapper = tagMapper;
	}

	public TagCount selectCountByPrimaryKey(Integer id){
		return tagMapper.selectCountByPrimaryKey(id);
	}

	
}
