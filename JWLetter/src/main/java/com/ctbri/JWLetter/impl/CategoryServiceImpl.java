package com.ctbri.JWLetter.impl;

import com.ctbri.JWLetter.DAO.CategoryMapper;
import com.ctbri.JWLetter.pojo.Category;

public class CategoryServiceImpl {

	private static CategoryMapper categoryMapper;
	
	


	public static CategoryMapper getCategoryMapper() {
		return categoryMapper;
	}




	public static void setCategoryMapper(CategoryMapper categoryMapper) {
		CategoryServiceImpl.categoryMapper = categoryMapper;
	}




	public int insert(Category category) {
		// TODO Auto-generated method stub
		return categoryMapper.insert(category);
	}

}
