package com.culture.user.qna.vo;


import com.culture.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class UserQnaVO extends CommonVO {
		
		private int category; 
	    private String user_id;
	    private int qna_id; 
	    private String question;
	    private String answer;
	    private String question_date;
	    private String answer_date;
	    

}
