package edu.kosmo.kbat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosmo.kbat.mapper.ProductMapper;
import edu.kosmo.kbat.vo.ProductVO;

//@Slf4j
@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productMapper;

	@Override
	public List<ProductVO> getList() {
		// log.info("getList()..");
		return productMapper.getList();
	}

	@Override
	public ProductVO get(int product_id) {
		return productMapper.get(product_id);
	}

	@Override
	public void write(ProductVO product) {
		String category_name = product.getCategory_name();

		// get category_id from category table in db
		int category_id = productMapper.readCategory_id(category_name);
		product.setCategory_id(category_id);

		// set product table
		productMapper.write(product);

		// set video_name into video table
		productMapper.writeVideo(product.getVideo_name());

		// set image_name into Image table
		productMapper.writeImage(product.getImage_name());
	};

	@Override
	public void delete(int product_id) {
		productMapper.deleteImage(product_id);
		productMapper.deleteVideo(product_id);
		productMapper.deleteProduct(product_id);
	}

}
