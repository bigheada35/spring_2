package edu.kosmo.kbat.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.kbat.vo.ProductOrderVO;

@Mapper
public interface ProductOrderMapper {
	// 주문내역 리스트 가져오기
	public List<ProductOrderVO> getOrderList(String member_id);
	

}
