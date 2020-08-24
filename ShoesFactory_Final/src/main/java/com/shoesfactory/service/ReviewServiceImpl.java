package com.shoesfactory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoesfactory.DAOVO.review.ReviewDAO;
import com.shoesfactory.DAOVO.review.ReviewVO;

@Service("ReviewService")
public class ReviewServiceImpl implements ReviewService{

	@Autowired 
	private ReviewDAO reviewdao;
	
	@Override
	public List<ReviewVO> GetSelectReview(ReviewVO vo1){
		List<ReviewVO> list1 = reviewdao.getSelectReview(vo1);
		return list1;
	}
	
	@Override
	public List<ReviewVO> GetSelectUpdate(ReviewVO vo1){
		List<ReviewVO> list1 = reviewdao.getSelectUpdate(vo1);
		return list1;
	}
	
	@Override
	public void GetInsertReview(ReviewVO vo1) {
		reviewdao.getInsertReview(vo1);
	}
	
	@Override
	public void GetUpdateReview(ReviewVO vo1) {
		reviewdao.getUpdateReview(vo1);
	}
	
	@Override
	public void GetDeleteReview(ReviewVO vo1) {
		reviewdao.getDeleteReview(vo1);
	}
	
}
