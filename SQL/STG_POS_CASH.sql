create table STG_POS_CASH as 
select 
			SK_ID_CURR
		,	count(*) as pos_cash_records
		,	MAX(months_balance) as pos_last_month
		,	max(sk_dpd) as pos_max_dpd
		,	avg(sk_dpd) as pos_avg_dpd
		,	MAX(SK_DPD_DEF) as pos_max_dpd_def
		,	count(case when sk_dpd > 0 then 1 end) as pos_dpd_cnt
		,	count(case when sk_dpd > 0 and months_balance >= -3 then 1 end) as pos_dpd_3m
		,	count(case when sk_dpd > 0 and months_balance >= -6 then 1 end) as pos_dpd_6m
		,	count(case when sk_dpd > 0 and months_balance >= -9 then 1 end) as pos_dpd_9m
		,	count(case when sk_dpd > 0 and months_balance >= -12 then 1 end) as pos_dpd_12m
		, 	count(case when name_contract_status = 'Active' then 1 end) as pos_active_cnt
		,	count(case when name_contract_status = 'Completed' then 1 end) as pos_completed_cnt
from POS_CASH_balance 
group by SK_ID_CURR
