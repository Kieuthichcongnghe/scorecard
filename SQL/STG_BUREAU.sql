--CREATE INDEX IF NOT EXISTS IDX_SK_ID_BUREAU ON BUREAU(SK_ID_BUREAU);

CREATE TABLE STG_BUREAU as
SELECT 
		SK_ID_CURR
	,	COUNT(*) AS bureau_loan_cnt
	,	SUM(CASE WHEN CREDIT_ACTIVE = "Active" then 1 else 0 end) as bureau_active_cnt
	, 	SUM(CASE WHEN CREDIT_ACTIVE = "Closed" then 1 else 0 end) as bureau_close_cnt
	,	AVG(AMT_CREDIT_SUM) as credit_amt_avg
	,	SUM(AMT_CREDIT_SUM) as credit_amt_sum
	,	SUM(AMT_CREDIT_SUM_DEBT) as total_bureau_debt
	,	SUM(AMT_CREDIT_SUM_LIMIT) as total_bureau_limit
	,	SUM(AMT_CREDIT_SUM_OVERDUE) as total_bureau_overdue
	,	SUM(AMT_CREDIT_SUM_DEBT) / nullif(SUM(AMT_CREDIT_SUM),0) as bureau_debt_ratio
	,	MAX(CREDIT_DAY_OVERDUE) as overdue_days_max
	,	count(case when credit_day_overdue > 0 then 1 end) as overdue_loan_cnt
	,	SUM(CNT_CREDIT_PROLONG) as total_prolong_cnt
	,	count(case when days_credit >= -90 then 1 end) as bureau_open_3m
	,	count(case when days_credit >= -180 then 1 end) as bureau_open_6m
	,	count(case when days_credit >= -270 then 1 end) as bureau_open_9m
	,	count(case when days_credit >= -360 then 1 end) as bureau_open_12m
FROM bureau b 
GROUP BY SK_ID_CURR


