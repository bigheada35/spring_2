package edu.kosmo.kbat.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.kbat.page.Criteria;
import edu.kosmo.kbat.vo.ProductVO;

@Mapper
public interface MainMapper {

	// KDM 상품 검색
	public List<ProductVO> getProductList(Criteria cri);

	// 상품 총 갯수
	public int getProductTotal(Criteria cri);

}
