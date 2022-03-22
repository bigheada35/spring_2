package edu.kosmo.kbat.service;

import java.util.List;

import edu.kosmo.kbat.vo.CartVO;
import edu.kosmo.kbat.vo.ProductCartVO;
import edu.kosmo.kbat.vo.ProductVO;

public interface ProductCartService {
	
	List<ProductCartVO> getList(int member_number);
	
	ProductCartVO get(int member_number, int product_id);
	
	CartVO exist(int member_number, int product_id);
	
	void write(int member_number, int product_id);
	
	void delete(int member_number,int product_id);
}
