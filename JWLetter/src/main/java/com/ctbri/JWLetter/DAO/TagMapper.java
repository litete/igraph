package com.ctbri.JWLetter.DAO;

import com.ctbri.JWLetter.pojo.TagCount;

public interface TagMapper {

	public TagCount selectCountByPrimaryKey(Integer id);
	
}
