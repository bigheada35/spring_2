package edu.kosmo.kbat.service;

import edu.kosmo.kbat.joinvo.ProductOrderDetailOrderVO;
import edu.kosmo.kbat.vo.OrderVO;


public interface StatisticsService {

	
		// 일간 통계차트
	public OrderVO dailyChart();

		// 주간 통계차트
	public OrderVO weekChart();

		// 월간 통계차트
	public OrderVO monthChart();

		// 연간 통계차트
	public OrderVO yearChart();
}
