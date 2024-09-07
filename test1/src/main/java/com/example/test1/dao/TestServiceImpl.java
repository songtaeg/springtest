package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.TestMapper;
import com.example.test1.model.Test;

@Service
public class TestServiceImpl implements TestService{
	
	@Autowired
	TestMapper testMapper;

	@Override
	public HashMap<String, Object> searchList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap=new HashMap<String, Object>();
		
		System.out.println(map); //잘 가는지 확인
		
		Test test=testMapper.testList(map);
		List<Test> list=testMapper.testListall(map);
		
		resultMap.put("test", test);
		resultMap.put("list", list);
		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> deleteList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap=new HashMap<String, Object>();
		//testMapper.deleteList(map);
		System.out.println(map);
		try {
			testMapper.deleteList(map);
			resultMap.put("message", "삭제 성공");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("message", "삭제 실패");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> updateList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap=new HashMap<String, Object>();
		testMapper.updateList(map);
		resultMap.put("message", "변경 성공");
		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> insertList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap=new HashMap<String, Object>();
		System.out.println(map);
		testMapper.insertList(map);
		resultMap.put("message", "저장 완료");
		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchBookList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap=new HashMap<String, Object>();
		
		//System.out.println(map);
		
		List<Test> list = testMapper.booklist(map);
		resultMap.put("list", list);
		
		return resultMap;
	}



}
