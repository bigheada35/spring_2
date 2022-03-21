package edu.kosmo.kbat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosmo.kbat.mapper.MainMapper;
import edu.kosmo.kbat.page.Criteria;
import edu.kosmo.kbat.vo.ProductVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	private MainMapper mainMapper;
	
	
	
	@Override
	public List<ProductVO> getProductList(Criteria cri) {
		log.info("getProductList");
		return mainMapper.getProductList(cri);
	}

	@Override
	public int getProductTotal(Criteria cri) {
		log.info("getProductTotal");
		return  mainMapper.getProductTotal(cri);
	}



}
