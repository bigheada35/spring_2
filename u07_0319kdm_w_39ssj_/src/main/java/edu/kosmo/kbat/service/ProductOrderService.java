package edu.kosmo.kbat.service;

import java.util.List;

import edu.kosmo.kbat.vo.ProductOrderVO;


public interface ProductOrderService {
	// 주문내역 리스트 가져오기
	public List<ProductOrderVO> getOrderList(String member_id);
	
	public void write(int product_price, int member_number, int product_id);
	
	public void delete(int orders_id);
	
}