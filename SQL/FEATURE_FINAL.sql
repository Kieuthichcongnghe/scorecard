CREATE TABLE FEATURE_FINAL AS
SELECT
    /* ---------- 00-03. STG_BASE_APP (31 cot) ---------- */
      CAST(NULLIF(TRIM(a.SK_ID_CURR)         ,'') AS INTEGER) AS SK_ID_CURR
    , CAST(NULLIF(TRIM(a.TARGET)             ,'') AS INTEGER) AS TARGET
    , TRIM(a.CODE_GENDER)                                      AS CODE_GENDER
    , TRIM(a.FLAG_OWN_CAR)                                     AS FLAG_OWN_CAR
    , TRIM(a.FLAG_OWN_REALTY)                                  AS FLAG_OWN_REALTY
    , CAST(NULLIF(TRIM(a.CNT_CHILDREN)       ,'') AS INTEGER) AS CNT_CHILDREN
    , CAST(NULLIF(TRIM(a.AMT_INCOME_TOTAL)   ,'') AS REAL)    AS AMT_INCOME_TOTAL
    , CAST(NULLIF(TRIM(a.AMT_CREDIT)         ,'') AS REAL)    AS AMT_CREDIT
    , CAST(NULLIF(TRIM(a.AMT_ANNUITY)        ,'') AS REAL)    AS AMT_ANNUITY
    , CAST(NULLIF(TRIM(a.AMT_GOODS_PRICE)    ,'') AS REAL)    AS AMT_GOODS_PRICE
    , CAST(NULLIF(TRIM(a.DAYS_BIRTH)         ,'') AS INTEGER) AS DAYS_BIRTH
    , CAST(NULLIF(TRIM(a.DAYS_EMPLOYED)      ,'') AS INTEGER) AS DAYS_EMPLOYED
    , CAST(NULLIF(TRIM(a.DAYS_REGISTRATION)  ,'') AS REAL)    AS DAYS_REGISTRATION
    , CAST(NULLIF(TRIM(a.DAYS_ID_PUBLISH)    ,'') AS INTEGER) AS DAYS_ID_PUBLISH
    , CAST(NULLIF(TRIM(a.OWN_CAR_AGE)        ,'') AS REAL)    AS OWN_CAR_AGE
    , CAST(NULLIF(TRIM(a.AGE_YEARS)          ,'') AS REAL)    AS AGE_YEARS
    , CAST(NULLIF(TRIM(a.EMPLOYED_YEARS)     ,'') AS REAL)    AS EMPLOYED_YEARS
    , CAST(NULLIF(TRIM(a.flag_days_employed_anom),'') AS INTEGER) AS flag_days_employed_anom
    , CAST(NULLIF(TRIM(a.EXT_SOURCE_1)       ,'') AS REAL)    AS EXT_SOURCE_1
    , CAST(NULLIF(TRIM(a.EXT_SOURCE_2)       ,'') AS REAL)    AS EXT_SOURCE_2
    , CAST(NULLIF(TRIM(a.EXT_SOURCE_3)       ,'') AS REAL)    AS EXT_SOURCE_3
    , CAST(NULLIF(TRIM(a.EXT_SOURCE_AVG)     ,'') AS REAL)    AS EXT_SOURCE_AVG
    , CAST(NULLIF(TRIM(a.CREDIT_INCOME_RATIO),'') AS REAL)    AS CREDIT_INCOME_RATIO
    , CAST(NULLIF(TRIM(a.ANNUITY_INCOME_RATIO),'') AS REAL)   AS ANNUITY_INCOME_RATIO
    , CAST(NULLIF(TRIM(a.CREDIT_TERM_PROXY)  ,'') AS REAL)    AS CREDIT_TERM_PROXY
    , CAST(NULLIF(TRIM(a.ANNUITY_CREDIT_RATIO),'') AS REAL)   AS ANNUITY_CREDIT_RATIO
    , CAST(NULLIF(TRIM(a.LTV_RATIO)          ,'') AS REAL)    AS LTV_RATIO
    , CAST(NULLIF(TRIM(a.GOODS_INCOME_RATIO) ,'') AS REAL)    AS GOODS_INCOME_RATIO
    , CAST(NULLIF(TRIM(a.employed_to_age_ratio),'') AS REAL)  AS employed_to_age_ratio
    , CAST(NULLIF(TRIM(a.income_per_family_member),'') AS REAL) AS income_per_family_member
    , CAST(NULLIF(TRIM(a.children_ratio)     ,'') AS REAL)    AS children_ratio
    /* ---------- 04. STG_BUREAU (16 cot) ---------- */
    , CAST(NULLIF(TRIM(b.bureau_loan_cnt)    ,'') AS INTEGER) AS bureau_loan_cnt
    , CAST(NULLIF(TRIM(b.bureau_active_cnt)  ,'') AS INTEGER) AS bureau_active_cnt
    , CAST(NULLIF(TRIM(b.bureau_close_cnt)   ,'') AS INTEGER) AS bureau_closed_cnt
    , CAST(NULLIF(TRIM(b.credit_amt_avg)     ,'') AS REAL)    AS credit_amt_avg
    , CAST(NULLIF(TRIM(b.credit_amt_sum)     ,'') AS REAL)    AS credit_amt_sum
    , CAST(NULLIF(TRIM(b.total_bureau_debt)  ,'') AS REAL)    AS total_bureau_debt
    , CAST(NULLIF(TRIM(b.total_bureau_limit) ,'') AS REAL)    AS total_bureau_limit
    , CAST(NULLIF(TRIM(b.total_bureau_overdue),'') AS REAL)   AS total_bureau_overdue
    , CAST(NULLIF(TRIM(b.bureau_debt_ratio)  ,'') AS REAL)    AS bureau_debt_ratio
    , CAST(NULLIF(TRIM(b.overdue_days_max)   ,'') AS INTEGER) AS overdue_days_max
    , CAST(NULLIF(TRIM(b.overdue_loan_cnt)   ,'') AS INTEGER) AS overdue_loan_cnt
    , CAST(NULLIF(TRIM(b.total_prolong_cnt)  ,'') AS INTEGER) AS total_prolong_cnt
    , CAST(NULLIF(TRIM(b.bureau_open_3m)     ,'') AS INTEGER) AS bureau_open_3m
    , CAST(NULLIF(TRIM(b.bureau_open_6m)     ,'') AS INTEGER) AS bureau_open_6m
    , CAST(NULLIF(TRIM(b.bureau_open_9m)     ,'') AS INTEGER) AS bureau_open_9m
    , CAST(NULLIF(TRIM(b.bureau_open_12m)    ,'') AS INTEGER) AS bureau_open_12m
    /* ---------- 05. STG_BUREAU_DPD (7 cot) ---------- */
    , CAST(NULLIF(TRIM(g.bureau_bal_closed_cnt) ,'') AS INTEGER) AS bureau_bal_closed_cnt
    , CAST(NULLIF(TRIM(g.bureau_bal_unknown_cnt),'') AS INTEGER) AS bureau_bal_unknown_cnt
    , CAST(NULLIF(TRIM(g.dpd_3m) ,'') AS INTEGER) AS dpd_3m
    , CAST(NULLIF(TRIM(g.dpd_6m) ,'') AS INTEGER) AS dpd_6m
    , CAST(NULLIF(TRIM(g.dpd_9m) ,'') AS INTEGER) AS dpd_9m
    , CAST(NULLIF(TRIM(g.dpd_12m),'') AS INTEGER) AS dpd_12m
    , CAST(NULLIF(TRIM(g.dpd_24m),'') AS INTEGER) AS dpd_24m
    /* ---------- 07. STG_PREV_APP (17 cot) ---------- */
    , CAST(NULLIF(TRIM(c.prev_app_cnt)       ,'') AS INTEGER) AS prev_app_cnt
    , CAST(NULLIF(TRIM(c.approved_cnt)       ,'') AS INTEGER) AS approved_cnt
    , CAST(NULLIF(TRIM(c.refused_cnt)        ,'') AS INTEGER) AS refused_cnt
    , CAST(NULLIF(TRIM(c.canceled_cnt)       ,'') AS INTEGER) AS canceled_cnt
    , CAST(NULLIF(TRIM(c.prev_app_credit_ratio),'') AS REAL)  AS prev_app_credit_ratio
    , CAST(NULLIF(TRIM(c.prev_total_requested),'') AS REAL)   AS prev_total_requested
    , CAST(NULLIF(TRIM(c.prev_total_approved),'') AS REAL)    AS prev_total_approved
    , CAST(NULLIF(TRIM(c.prev_cash_loan_cnt) ,'') AS INTEGER) AS prev_cash_loan_cnt
    , CAST(NULLIF(TRIM(c.prev_consumer_loan_cnt),'') AS INTEGER) AS prev_consumer_loan_cnt
    , CAST(NULLIF(TRIM(c.prev_revolving_loan_cnt),'') AS INTEGER) AS prev_revolving_loan_cnt
    , CAST(NULLIF(TRIM(c.last_decision_days) ,'') AS INTEGER) AS last_decision_days
    , CAST(NULLIF(TRIM(c.first_decision_days),'') AS INTEGER) AS first_decision_days
    , CAST(NULLIF(TRIM(c.prev_app_3m)        ,'') AS INTEGER) AS prev_app_3m
    , CAST(NULLIF(TRIM(c.prev_app_6m)        ,'') AS INTEGER) AS prev_app_6m
    , CAST(NULLIF(TRIM(c.prev_app_9m)        ,'') AS INTEGER) AS prev_app_9m
    , CAST(NULLIF(TRIM(c.prev_app_12m)       ,'') AS INTEGER) AS prev_app_12m
    , CAST(NULLIF(TRIM(c.refused_12m)        ,'') AS INTEGER) AS refused_12m
    /* ---------- 06. STG_INST_AGG (16 cot) ---------- */
    , CAST(NULLIF(TRIM(d.inst_payment_cnt)   ,'') AS INTEGER) AS inst_payment_cnt
    , CAST(NULLIF(TRIM(d.max_days_late)      ,'') AS INTEGER) AS max_days_late
    , CAST(NULLIF(TRIM(d.avg_days_late)      ,'') AS REAL)    AS avg_days_late
    , CAST(NULLIF(TRIM(d.avg_days_early)     ,'') AS REAL)    AS avg_days_early
    , CAST(NULLIF(TRIM(d.late_payment_cnt)   ,'') AS INTEGER) AS late_payment_cnt
    , CAST(NULLIF(TRIM(d.late_3m)            ,'') AS INTEGER) AS late_3m
    , CAST(NULLIF(TRIM(d.late_6m)            ,'') AS INTEGER) AS late_6m
    , CAST(NULLIF(TRIM(d.late_9m)            ,'') AS INTEGER) AS late_9m
    , CAST(NULLIF(TRIM(d.late_12m)           ,'') AS INTEGER) AS late_12m
    , CAST(NULLIF(TRIM(d.inst_cnt_3m)        ,'') AS INTEGER) AS inst_cnt_3m
    , CAST(NULLIF(TRIM(d.inst_cnt_12m)       ,'') AS INTEGER) AS inst_cnt_12m
    , CAST(NULLIF(TRIM(d.total_inst_prescribed),'') AS REAL)  AS total_inst_prescribed
    , CAST(NULLIF(TRIM(d.total_inst_paid)    ,'') AS REAL)    AS total_inst_paid
    , CAST(NULLIF(TRIM(d.total_pay_ratio)    ,'') AS REAL)    AS total_pay_ratio
    , CAST(NULLIF(TRIM(d.underpay_cnt)       ,'') AS INTEGER) AS underpay_cnt
    , CAST(NULLIF(TRIM(d.avg_payment_diff)   ,'') AS REAL)    AS avg_payment_diff
    /* ---------- 08. STG_POS_CASH (12 cot) ---------- */
    , CAST(NULLIF(TRIM(e.pos_cash_records)   ,'') AS INTEGER) AS pos_cash_records
    , CAST(NULLIF(TRIM(e.pos_last_month)     ,'') AS INTEGER) AS pos_last_month
    , CAST(NULLIF(TRIM(e.pos_max_dpd)        ,'') AS INTEGER) AS pos_max_dpd
    , CAST(NULLIF(TRIM(e.pos_avg_dpd)        ,'') AS REAL)    AS pos_avg_dpd
    , CAST(NULLIF(TRIM(e.pos_max_dpd_def)    ,'') AS INTEGER) AS pos_max_dpd_def
    , CAST(NULLIF(TRIM(e.pos_dpd_cnt)        ,'') AS INTEGER) AS pos_dpd_cnt
    , CAST(NULLIF(TRIM(e.pos_dpd_3m)         ,'') AS INTEGER) AS pos_dpd_3m
    , CAST(NULLIF(TRIM(e.pos_dpd_6m)         ,'') AS INTEGER) AS pos_dpd_6m
    , CAST(NULLIF(TRIM(e.pos_dpd_9m)         ,'') AS INTEGER) AS pos_dpd_9m
    , CAST(NULLIF(TRIM(e.pos_dpd_12m)        ,'') AS INTEGER) AS pos_dpd_12m
    , CAST(NULLIF(TRIM(e.pos_active_cnt)     ,'') AS INTEGER) AS pos_active_cnt
    , CAST(NULLIF(TRIM(e.pos_completed_cnt)  ,'') AS INTEGER) AS pos_completed_cnt
    /* ---------- 09. STG_CREDIT_CARD (14 cot) ---------- */
    , CAST(NULLIF(TRIM(f.cc_records_cnt)     ,'') AS INTEGER) AS cc_records_cnt
    , CAST(NULLIF(TRIM(f.cc_avg_balance)     ,'') AS REAL)    AS cc_avg_balance
    , CAST(NULLIF(TRIM(f.cc_max_balance)     ,'') AS REAL)    AS cc_max_balance
    , CAST(NULLIF(TRIM(f.cc_avg_limit)       ,'') AS REAL)    AS cc_avg_limit
    , CAST(NULLIF(TRIM(f.cc_avg_utilization) ,'') AS REAL)    AS cc_avg_utilization
    , CAST(NULLIF(TRIM(f.cc_util_12m)		 ,'') AS REAL) AS cc_util_12m          
    , CAST(NULLIF(TRIM(f.cc_total_atm_drawn) ,'') AS REAL)    AS cc_total_atm_drawn
    , CAST(NULLIF(TRIM(f.cc_total_drawings_cnt),'') AS REAL)  AS cc_total_drawings_cnt
    , CAST(NULLIF(TRIM(f.cc_max_dpd)         ,'') AS INTEGER) AS cc_max_dpd
    , CAST(NULLIF(TRIM(f.cc_dpd_cnt)         ,'') AS INTEGER) AS cc_dpd_cnt
    , CAST(NULLIF(TRIM(f.cc_dpd_3m)          ,'') AS INTEGER) AS cc_dpd_3m
    , CAST(NULLIF(TRIM(f.cc_dpd_6m)          ,'') AS INTEGER) AS cc_dpd_6m
    , CAST(NULLIF(TRIM(f.cc_dpd_9m)          ,'') AS INTEGER) AS cc_dpd_9m
    , CAST(NULLIF(TRIM(f.cc_dpd_12m)         ,'') AS INTEGER) AS cc_dpd_12m
    /* ---------- 10. STG_CROSS (14 cot) ---------- */
    , CAST(NULLIF(TRIM(x.bureau_active_ratio)      ,'') AS REAL) AS bureau_active_ratio
    , CAST(NULLIF(TRIM(x.bureau_overdue_loan_ratio),'') AS REAL) AS bureau_overdue_loan_ratio
    , CAST(NULLIF(TRIM(x.bureau_overdue_debt_ratio),'') AS REAL) AS bureau_overdue_debt_ratio
    , CAST(NULLIF(TRIM(x.bureau_debt_income_ratio) ,'') AS REAL) AS bureau_debt_income_ratio
    , CAST(NULLIF(TRIM(x.total_debt_income_ratio)  ,'') AS REAL) AS total_debt_income_ratio
    , CAST(NULLIF(TRIM(x.approval_rate)            ,'') AS REAL) AS approval_rate
    , CAST(NULLIF(TRIM(x.refusal_rate)             ,'') AS REAL) AS refusal_rate
    , CAST(NULLIF(TRIM(x.cancel_rate)              ,'') AS REAL) AS cancel_rate
    , CAST(NULLIF(TRIM(x.late_payment_ratio)       ,'') AS REAL) AS late_payment_ratio
    , CAST(NULLIF(TRIM(x.late_ratio_3m)            ,'') AS REAL) AS late_ratio_3m
    , CAST(NULLIF(TRIM(x.late_ratio_12m)           ,'') AS REAL) AS late_ratio_12m
    , CAST(NULLIF(TRIM(x.underpay_ratio)       ,'') AS REAL) AS underpay_ratio      
    , CAST(NULLIF(TRIM(x.pos_dpd_ratio)            ,'') AS REAL) AS pos_dpd_ratio
    , CAST(NULLIF(TRIM(x.cc_dpd_ratio)        ,'') AS REAL) AS cc_dpd_ratio        
FROM STG_BASE_APP a
LEFT JOIN STG_BUREAU      b ON a.SK_ID_CURR = b.SK_ID_CURR
LEFT JOIN STG_BUREAU_DPD  g ON a.SK_ID_CURR = g.SK_ID_CURR
LEFT JOIN STG_PREV_APP    c ON a.SK_ID_CURR = c.SK_ID_CURR
LEFT JOIN STG_INST_AGG    d ON a.SK_ID_CURR = d.SK_ID_CURR
LEFT JOIN STG_POS_CASH    e ON a.SK_ID_CURR = e.SK_ID_CURR
LEFT JOIN STG_CREDIT_CARD f ON a.SK_ID_CURR = f.SK_ID_CURR
LEFT JOIN STG_CROSS       x ON a.SK_ID_CURR = x.SK_ID_CURR
