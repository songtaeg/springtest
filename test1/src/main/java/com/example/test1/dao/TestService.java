package com.example.test1.dao;

import java.util.HashMap;

public interface TestService {
	HashMap<String, Object> searchList(HashMap<String, Object> map);
	
	HashMap<String, Object> deleteList(HashMap<String, Object> map);
}
