package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Test;

@Mapper
public interface TestMapper {
	List<Test> testList(HashMap<String, Object> map);
	
	void deleteList(HashMap<String, Object> map);
}
