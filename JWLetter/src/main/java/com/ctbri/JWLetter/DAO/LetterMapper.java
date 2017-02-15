package com.ctbri.JWLetter.DAO;

import com.ctbri.JWLetter.pojo.Letter;
import com.ctbri.JWLetter.pojo.LetterResult;
import com.ctbri.JWLetter.pojo.LetterTitle;

import java.util.ArrayList;

public interface LetterMapper {

	public int insert(Letter letter);
	
	public int updateByPrimaryKey(Letter letter);
	
	public int deleteByPrimaryKey(String id);
	
	public Letter selectByPrimaryKey(String id);
	
	public ArrayList<Letter> select();
	
	public ArrayList<LetterResult> selectAll();
	
	public ArrayList<LetterTitle> selectTitles();
	
	public ArrayList<LetterResult> selectByTagId(Integer id);
	//根据关键字做出模糊匹配
	public ArrayList<LetterTitle> selectTitleByKeyWord(String keyword);
}
