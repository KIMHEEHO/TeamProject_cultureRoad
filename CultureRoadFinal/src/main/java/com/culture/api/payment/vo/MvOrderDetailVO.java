package com.culture.api.payment.vo;

import com.culture.common.vo.CommonVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class MvOrderDetailVO extends CommonVO {
    private int mvOrderId;
    private int mvPaymentId;
    private int userNo;
    private String userName;
    private int mvHeadcnt;
    private int mvPrice;
    private String selectedDate;
    private String mvOrderDate;
    private int mvPayStatus;
    private String mvTitle;
    
    public String getSelectedDate() {
        return selectedDate;
    }
    
    public void setSelectedDate(String selectedDate) {
        this.selectedDate = selectedDate;
    }
}
