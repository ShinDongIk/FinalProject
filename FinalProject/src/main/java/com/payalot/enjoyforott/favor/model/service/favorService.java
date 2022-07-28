package com.payalot.enjoyforott.favor.model.service;

import java.util.HashMap;


public interface favorService {

	int favor(HashMap<String,Object> good);

	int selectUser(String userId);

	int favor2(String userId);

}
