package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Test;

@Mapper
public interface TestMapper {
	//List(리스트 전체)
	List<Test> testListall (HashMap<String, Object> map);
	
	Test testList (HashMap<String, Object> map);
	// view(특정 항목) 

	// delete update insert 
	void deleteList(HashMap<String, Object> map);
	
	void updateList(HashMap<String, Object> map);
	
	void insertList(HashMap<String, Object> map);
	
	List<Test> booklist(HashMap<String, Object> map);
	
	void deletebook(HashMap<String, Object> map);
	
	void updatebook(HashMap<String, Object> map);
}
