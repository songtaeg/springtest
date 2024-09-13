package com.example.test1.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Study;

@Mapper
public interface StudyMapper {
	Study studyList (HashMap<String, Object> map);
}
