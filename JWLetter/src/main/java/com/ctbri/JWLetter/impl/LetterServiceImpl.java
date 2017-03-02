package com.ctbri.JWLetter.impl;

import com.ctbri.JWLetter.DAO.LetterMapper;
import com.ctbri.JWLetter.pojo.*;

import java.util.ArrayList;

public class LetterServiceImpl {

	private static LetterMapper letterMapper;
	
	public static LetterMapper getLetterMapper() {
		return letterMapper;
	}


	public static void setLetterMapper(LetterMapper letterMapper) {
		LetterServiceImpl.letterMapper = letterMapper;
	}


	public int insert(Letter letter) {
		// TODO Auto-generated method stub
		return letterMapper.insert(letter);
	}

	
	public int updateByPrimaryKey(Letter letter) {
		// TODO Auto-generated method stub
		return letterMapper.updateByPrimaryKey(letter);
	}

	
	public int deleteByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		return letterMapper.deleteByPrimaryKey(id);
	}

	
	public Letter selectByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		return letterMapper.selectByPrimaryKey(id);
	}
	
	public ArrayList<Letter> select(){
		
		return letterMapper.select();
	}

	public ArrayList<LetterResult> selectAll(){
		return letterMapper.selectAll();
	}
	
	public ArrayList<LetterTitle> selectTitles(){
		return letterMapper.selectTitles();
	}
	
	public ArrayList<LetterResult> selectByTagId(Integer id){
		return letterMapper.selectByTagId(id);
	}
	//根据关键字做出模糊匹配
	public ArrayList<LetterTitle> selectTitleByKeyWord(String keyword){return letterMapper.selectTitleByKeyWord(keyword);}
	//查询id,tagname 为es做准备
	public  ArrayList<EsSmall> selectessmall(){
		return letterMapper.selectessmall();
	};
	//查询all 为es做准备
	public ArrayList<Es> selectEs(){
		return letterMapper.selectEs();
	}
}
