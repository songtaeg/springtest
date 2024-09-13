package com.example.test1.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.StudyMapper;

@Service
public class StudyServiceImpl implements StudyService{
	
	@Autowired
	StudyMapper studyMapper;

	@Override
	public HashMap<String, Object> searchStudy(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
