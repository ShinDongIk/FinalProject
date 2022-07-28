package com.payalot.enjoyforott.poster.model.service;

import java.util.ArrayList;

import com.payalot.enjoyforott.poster.model.vo.Poster;
import com.payalot.enjoyforott.poster.model.vo.PosterRank;

public interface posterService {

	ArrayList<PosterRank> PostRank(String name) throws InterruptedException;

	int AutoInput(Poster pr);

	ArrayList<Poster> PostAction(String list);

	Poster PostDetail(int postNo);
	
	
}
