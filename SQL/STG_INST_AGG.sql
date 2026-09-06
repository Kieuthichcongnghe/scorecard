create table STG_INST_AGG as
select 
			SK_ID_CURR
		,	count(1) as inst_payment_cnt
		,	MAX(case when days_instalment < days_entry_payment then days_entry_payment - days_instalment else 0 end) as max_days_late
		,	AVG(case when days_instalment < days_entry_payment then days_entry_payment - days_instalment else 0 end) as avg_days_late
		,	AVG(case when days_instalment > days_entry_payment then days_instalment - days_entry_payment else 0 end) as avg_days_early
		,	COUNT(case when days_instalment < days_entry_payment then 1 end) as late_payment_cnt
		,	count(case when days_instalment >= -90 and days_instalment < days_entry_payment then 1 end) as late_3m
		,	count(case when days_instalment >= -180 and days_instalment < days_entry_payment then 1 end) as late_6m
		,	count(case when days_instalment >= -270 and days_instalment < days_entry_payment then 1 end) as late_9m
		,	count(case when days_instalment >= -360 and days_instalment < days_entry_payment then 1 end) as late_12m
		,	count(case when days_instalment >= -90 then 1 end) as inst_cnt_3m
		,	count(case when days_instalment >= -360 then 1 end) as inst_cnt_12m	
		,	SUM(AMT_INSTALMENT) as total_inst_prescribed
		,	SUM(AMT_PAYMENT) as total_inst_paid
		,	SUM(AMT_PAYMENT) / nullif(sum(amt_instalment),0) as total_pay_ratio
		,	count(case when AMT_PAYMENT < AMT_INSTALMENT then 1 end) as underpay_cnt
		,	AVG(AMT_PAYMENT - AMT_INSTALMENT) as avg_payment_diff
from installments_payments ip 
group by SK_ID_CURR
