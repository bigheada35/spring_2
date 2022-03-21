package edu.kosmo.kbat.service;

import java.util.List;

import edu.kosmo.kbat.page.Criteria;
import edu.kosmo.kbat.vo.ProductVO;

public interface MainService {

	// 판매자 리스트
	public List<ProductVO> getProductList(Criteria cri);

	public int getProductTotal(Criteria cri);
}
