package edu.kosmo.kbat.service;

import java.util.List;

import edu.kosmo.kbat.page.Criteria;
import edu.kosmo.kbat.vo.BoardtypeVO;
import edu.kosmo.kbat.vo.NBoardAndMemberVO;

public interface NBoardService {

	// 공지사항 : n, 후기 : r, 문의 : q
	// ssj2
	// List<NBoardVO> getList();
	List<NBoardAndMemberVO> getList();// ssj2

	NBoardAndMemberVO read(int board_id); // esh ㅁㅁㅁㅁㅁ

	void write(NBoardAndMemberVO board); // ㅁㅁㅁㅁㅁㅁ
	// void write(NBoardVO board); esh

	void modify(NBoardAndMemberVO board); // ㅁㅁㅁㅁㅁㅁ

	void hit(int board_id);

	void delete(int board_id);

	public int getTotal();

	public List<NBoardAndMemberVO> getList(Criteria criteria);

	List<BoardtypeVO> getboardtypeList();

}
