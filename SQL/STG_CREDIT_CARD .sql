create table STG_CREDIT_CARD as
select 
			SK_ID_CURR
		,	count(*) as cc_records_cnt
		,	AVG(AMT_BALANCE) as cc_avg_balance
		,	MAX(AMT_BALANCE) as cc_max_balance
		,	AVG(AMT_CREDIT_LIMIT_ACTUAL) as cc_avg_limit
		,	AVG(AMT_BALANCE/ nullif(AMT_CREDIT_LIMIT_ACTUAL,0)) as cc_avg_utilization
		,	AVG(case when months_balance >= -12 then AMT_BALANCE/ nullif(AMT_CREDIT_LIMIT_ACTUAL,0) else 0 end) as cc_util_12m
		,	SUM(AMT_DRAWINGS_ATM_CURRENT) as cc_total_atm_drawn
		,	SUM(CNT_DRAWINGS_CURRENT) as cc_total_drawings_cnt
		,	MAX(SK_DPD) as cc_max_dpd
		,	count(case when sk_dpd > 0  then 1 end) as cc_dpd_cnt
		,	count(case when sk_dpd > 0 and months_balance >= -3  then 1 end) as cc_dpd_3m
		,	count(case when sk_dpd > 0 and months_balance >= -6  then 1 end) as cc_dpd_6m
		,	count(case when sk_dpd > 0 and months_balance >= -9  then 1 end) as cc_dpd_9m
		,	count(case when sk_dpd > 0 and months_balance >= -12  then 1 end) as cc_dpd_12m
from credit_card_balance 
group by sk_id_curr