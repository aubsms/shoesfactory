package com.shoesfactory.service;

import java.util.List;

import com.shoesfactory.DAOVO.review.ReviewVO;

public interface ReviewService {
	
public List<ReviewVO> GetSelectReview(ReviewVO vo1);
	
	public List<ReviewVO> GetSelectUpdate(ReviewVO vo1);
	
	public void GetInsertReview(ReviewVO vo1);

	public void GetUpdateReview(ReviewVO vo1);

	public void GetDeleteReview(ReviewVO vo1);
	
}
