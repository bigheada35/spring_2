package edu.kosmo.kbat.page;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class Criteria {
	// 페이징 처리를 위해선 페이지번호와 한페이지당 볓개의 데이터를 보여줄것인지 결정되어야만 한다.

	private int pageNum; // 페이지 번호
	private int amount; // 한페이지당 몇개의 데이터를 보여줄것인가?

	public Criteria() {
		this(1, 10); // 기본값 페이지 10개로 지정(디폴트로)
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	// 검색 type KDM(https://kimvampa.tistory.com/245?category=771727)
	private String type; // 내용, 제목, 카테고리

	// 검색 키워드
	private String keyword;

	// 검색 조건 N상품명 D상품설명 C카테고리명
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}

}