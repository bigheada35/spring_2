package edu.kosmo.kbat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosmo.kbat.mapper.ProductOrderMapper;
import edu.kosmo.kbat.vo.ProductOrderVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProductOrderServiceImpl implements ProductOrderService {

	@Autowired
	private ProductOrderMapper productOrderMapper;
	
	// 주문내역 리스트
	@Override
	public List<ProductOrderVO> getOrderList(String member_id) {
		log.info("getOrderMyList()......");
		return productOrderMapper.getOrderList(member_id);
	}

	@Override
	public void write(int product_price, int member_number, int product_id) {
		
		productOrderMapper.write_orders(product_price, member_number);
		productOrderMapper.write_order_detail(product_id);
		
	}
	
	@Override
	public void delete(int orders_id) {
		
		productOrderMapper.delete_order_detail(orders_id);
		productOrderMapper.delete_orders(orders_id);

	}
}
