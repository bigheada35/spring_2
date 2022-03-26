package edu.kosmo.kbat.mapper;

import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.kbat.vo.OrderVO;

@Mapper
public interface StatisticsMapper {


	
	// 일간 통계차트
	public OrderVO dailyChart();

	// 주간 통계차트
	public OrderVO weekChart();

	// 월간 통계차트
	public OrderVO monthChart();

	// 연간 통계차트
	public OrderVO yearChart();

}
