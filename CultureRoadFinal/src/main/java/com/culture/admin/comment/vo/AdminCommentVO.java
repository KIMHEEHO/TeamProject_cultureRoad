package com.culture.admin.comment.vo;

import com.culture.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

/* equals와 hashCode 메소드 자동 생성 시 부모 클래스의 필드까지 감안할지 안 할지에 대해서 설정시
 * callSuper = true로 설정하면 부모 클래스 필드 값들도 동일 한지 체크하며,
 * callSuper = false로 설정(기본값)하면 자신 클래스의 필드 값들만 고려한다*/

@Data
@EqualsAndHashCode(callSuper = false)
public class AdminCommentVO extends CommonVO {
	private int mvCoNum = 0; 							// 글번호
	private int id = 0; 								// 영화 번호
	private String mvCoContent = ""; 					// 내용
	private String mvCoWriteDate; 					// 작성일
	private int userNo = 0; 							// 유저 번호
	private String userName = ""; 					    // 유저 이름
	private int mvCoHidden = 0; 
	private String title;								// 영화 제목

	/*
	 * --------------------------------------------------------------------- 데이터베이스
	 * 컬럼명 b_num number not null, b_name varchar2(15) not null, b_title
	 * varchar2(1000) not null, b_content clob, b_pwd varchar2(18) not null, b_date
	 * date default sysdate
	 * ---------------------------------------------------------------------
	 * 
	 * @Data 어노테이션을 사용하면 다음과 같은 것들이 자동으로 생성됩니다:
	 * 
	 * Getter 메서드: 클래스의 모든 필드에 대한 getter 메서드를 생성합니다. Setter 메서드: 클래스의 모든 필드에 대한
	 * setter 메서드를 생성합니다. equals()와 hashCode() 메서드: 객체 비교 및 해시 코드 생성을 위한 메서드입니다.
	 * toString() 메서드: 객체의 문자열 표현을 생성하는 메서드입니다. 기본 생성자: 필드를 초기화하지 않는 기본 생성자를 생성합니다
	 * (이미 명시적으로 생성자가 정의되어 있지 않은 경우에만).
	 * ---------------------------------------------------------------------
	 */

}
