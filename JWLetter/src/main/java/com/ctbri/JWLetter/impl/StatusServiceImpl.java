package com.ctbri.JWLetter.impl;

import com.ctbri.JWLetter.DAO.StatusMapper;
import com.ctbri.JWLetter.pojo.Status;

public class StatusServiceImpl {

	private static StatusMapper statusMapper;

	public static StatusMapper getStatusMapper() {
		return statusMapper;
	}

	public static void setStatusMapper(StatusMapper statusMapper) {
		StatusServiceImpl.statusMapper = statusMapper;
	}




	public int insert(Status status) {
		// TODO Auto-generated method stub
		return statusMapper.insert(status);
	}

}
