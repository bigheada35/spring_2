package edu.kosmo.kbat.service;

import org.springframework.stereotype.Service;

import edu.kosmo.kbat.joinvo.ProductOrderDetailOrderVO;
import edu.kosmo.kbat.mapper.StatisticsMapper;
import edu.kosmo.kbat.vo.OrderVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class StatisticsServicelmpl implements StatisticsService {

	private StatisticsMapper staticsMapper;

	@Override
	public OrderVO dailyChart() {
		// TODO Auto-generated method stub
		return staticsMapper.dailyChart();
	}

	@Override
	public OrderVO weekChart() {
		// TODO Auto-generated method stub
		return staticsMapper.weekChart();
	}

	@Override
	public OrderVO monthChart() {
		// TODO Auto-generated method stub
		return staticsMapper.monthChart();
	}

	@Override
	public OrderVO yearChart() {
		// TODO Auto-generated method stub
		return staticsMapper.yearChart();
	}

}
