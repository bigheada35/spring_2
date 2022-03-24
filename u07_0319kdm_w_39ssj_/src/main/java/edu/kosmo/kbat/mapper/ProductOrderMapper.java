package edu.kosmo.kbat.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.kbat.vo.ProductOrderVO;

@Mapper
public interface ProductOrderMapper {
	// 주문내역 리스트 가져오기
	public List<ProductOrderVO> getOrderList(String member_id);
	
	// 주문내역 삽입하기
	public void write_orders(int product_price, int member_number);
	public void write_order_detail(int product_id);
	
	// 주문내역 삭제하기 -- 삭제시 순서 주의 
	@Delete("delete from order_detail where orders_id=#{orders_id}")
	public void delete_order_detail(int orders_id);
	@Delete("delete from orders where orders_id=#{orders_id}")
	public void delete_orders(int orders_id);
}

