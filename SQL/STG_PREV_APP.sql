create table STG_PREV_APP as
select 
			SK_ID_CURR
		,	count(*) as prev_app_cnt
		,	count(case when NAME_CONTRACT_STATUS = 'Approved' then 1 end) approved_cnt
		,	count(case when NAME_CONTRACT_STATUS = 'Refused' then 1 end) refused_cnt
		,	count(case when NAME_CONTRACT_STATUS = 'Canceled' then 1 end) canceled_cnt
		,	avg(AMT_CREDIT / nullif(AMT_APPLICATION,0)) as prev_app_credit_ratio
		,	SUM(AMT_APPLICATION) as prev_total_requested
		,	SUM(AMT_CREDIT) as prev_total_approved
		,	count(case when name_contract_type = 'Cash loans' then 1 end) as prev_cash_loan_cnt
		,	count(case when name_contract_type = 'Consumer loans' then 1 end) as prev_consumer_loan_cnt
		,	count(case when name_contract_type = 'Revolving loans' then 1 end) as prev_revolving_loan_cnt
		,	max(days_decision) as last_decision_days
		,	min(days_decision) as first_decision_days
		,	count(case when days_decision >= -90 then 1 end) as prev_app_3m
		,	count(case when days_decision >= -180 then 1 end) as prev_app_6m
		,	count(case when days_decision >= -270 then 1 end) as prev_app_9m
		,	count(case when days_decision >= -360 then 1 end) as prev_app_12m
		,	count(case when days_decision >= -360 and name_contract_status = 'Refused' then 1 end) as refused_12m
from previous_application a 
group by SK_ID_CURR