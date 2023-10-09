package com.culture.api.payment.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PaymentVO {
    private int mvPaymentId;
    private int mvCode;
    private int mvPrice;
    private String selectedDate;
    private int mvPayStatus;
    private String mvOrderDate;
    private int userNo;
    private String userName;
    private int mvHeadcnt;
    private String mvTitle;
}
