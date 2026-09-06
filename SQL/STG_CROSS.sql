create table STG_CROSS as
select 
		a.sk_id_curr
		,	cast(bureau_active_cnt as real) / nullif(CAST(bureau_loan_cnt as real),0) as bureau_active_ratio
		,	cast(overdue_loan_cnt as real) / nullif(cast(bureau_loan_cnt as real), 0) as bureau_overdue_loan_ratio
		,	cast(total_bureau_overdue as real) / nullif(cast(total_bureau_debt as real), 0) as bureau_overdue_debt_ratio
		,	cast(total_bureau_debt as real) / nullif(a.AMT_INCOME_TOTAL ,0) as bureau_debt_income_ratio
		,	(cast(total_bureau_debt as real) + a.AMT_CREDIT) / nullif(a.AMT_INCOME_TOTAL, 0) as total_debt_income_ratio
		,	cast(c.approved_cnt as real) / nullif(cast(c.prev_app_cnt as real),0) as approval_rate
		,	cast(refused_cnt as real) / nullif(cast(prev_app_cnt as real), 0) as refusal_rate
		,	cast(canceled_cnt as real) / nullif(cast(prev_app_cnt as real), 0) as cancel_rate
		,	cast(late_payment_cnt as real) / nullif(cast(inst_payment_cnt as real), 0) as late_payment_ratio
		,	cast(late_3m as real) / nullif(cast(inst_cnt_3m as real), 0) as late_ratio_3m
		,	cast(late_12m as real) / nullif(cast(inst_cnt_12m as real), 0) as late_ratio_12m
		,	cast(underpay_cnt as real) / nullif(cast(inst_payment_cnt as real), 0) as underpay_ratio
		,	cast(pos_dpd_cnt as real) / nullif(cast(pos_cash_records as real), 0) as pos_dpd_ratio
		,	cast(cc_dpd_cnt as real) / nullif(cast(cc_records_cnt as real), 0) as cc_dpd_ratio
from  application_train a
left join STG_BUREAU b on a.sk_id_curr = b.sk_id_curr
left join STG_PREV_APP c on a.sk_id_curr = c.sk_id_curr
left join STG_INST_AGG d on a.sk_id_curr = d.sk_id_curr
left join STG_POS_CASH e on a.sk_id_curr = e.sk_id_curr
left join STG_CREDIT_CARD f on a.sk_id_curr = f.sk_id_curr
left join STG_BUREAU_DPD g on a.sk_id_curr = g.sk_id_curr
GROUP by a.sk_id_curr