package edu.kosmo.kbat.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import edu.kosmo.kbat.vo.CartVO;
import edu.kosmo.kbat.vo.ProductCartVO;
import edu.kosmo.kbat.vo.ProductVO;
import edu.kosmo.kbat.vo.UserVO;

@Mapper
public interface ProductCartMapper {
	
	// 상품 리스트 읽어 오기  - 
	List<ProductCartVO> getList(int member_number);
	
	//상품 읽어 오기
	ProductCartVO get(int member_number, int product_id);
	
	CartVO exist(int member_number, int product_id);
	
	// 상품 카트 등록  
	void write(int member_number, int product_id);
	
	//--삭제시 -- cart 테이블만 삭제하고, product 테이블은 삭제하지 않음.
	@Delete("delete from cart where PRODUCT_ID=#{product_id} and member_number=#{member_number}")
	void deleteCart(int member_number,int product_id);
}
