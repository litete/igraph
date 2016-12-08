package com.ctbri.JWLetter.DAO;

import java.util.ArrayList;
import java.util.List;

import com.ctbri.JWLetter.pojo.Letter;
import com.ctbri.JWLetter.pojo.LetterResult;
import com.ctbri.JWLetter.pojo.LetterTitle;

public interface LetterMapper {

	public int insert(Letter letter);
	
	public int updateByPrimaryKey(Letter letter);
	
	public int deleteByPrimaryKey(String id);
	
	public Letter selectByPrimaryKey(String id);
	
	public ArrayList<Letter> select();
	
	public ArrayList<LetterResult> selectAll();
	
	public ArrayList<LetterTitle> selectTitles();
	
	public ArrayList<LetterResult> selectByTagId(Integer id);
}
