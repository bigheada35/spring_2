package edu.kosmo.kbat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosmo.kbat.mapper.ProductCartMapper;
import edu.kosmo.kbat.mapper.ProductMapper;
import edu.kosmo.kbat.vo.CartVO;
import edu.kosmo.kbat.vo.ProductCartVO;
import edu.kosmo.kbat.vo.ProductVO;

import lombok.extern.slf4j.Slf4j;

//@Slf4j
@Service
public class ProductCartServiceImpl implements ProductCartService{
	
	@Autowired
	private ProductCartMapper productCartMapper;
	
	@Override
	public List<ProductCartVO> getList(int member_number) {
		//log.info("getList()..");
		return productCartMapper.getList(member_number);
	}

	@Override
	public ProductCartVO get(int member_number, int product_id) {
		return productCartMapper.get(member_number, product_id);
	}
	
	@Override
	public CartVO exist(int member_number, int product_id) {
		return productCartMapper.exist(member_number, product_id);
	}
	
	@Override
	public void write(int member_number, int product_id) {

		productCartMapper.write(member_number, product_id);

	};
	
	@Override
	public void delete(int member_number,int product_id) {
		productCartMapper.deleteCart(member_number, product_id);
	}
	
}
