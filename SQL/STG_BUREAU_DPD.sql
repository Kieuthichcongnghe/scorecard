--create index if not exists idx_stg_bureau_dpd on stg_bureau_dpd(SK_ID_CURR)
create table STG_BUREAU_DPD as
select 	 c.SK_ID_CURR 
		,	count(case when b.status = 'C' then 1 end) as bureau_bal_closed_cnt
		,	count(case when b.status = 'X' then 1 end) as bureau_bal_unknown_cnt
		,	count(case when b.months_balance >= -3 and b.status in ('1','2','3','4','5') then 1 end) as dpd_3m
		,	count(case when b.months_balance >= -6 and b.status in ('1','2','3','4','5') then 1 end) as dpd_6m
		,	count(case when b.months_balance >= -9 and b.status in ('1','2','3','4','5') then 1 end) as dpd_9m
		,	count(case when b.months_balance >= -12 and b.status in ('1','2','3','4','5') then 1 end) as dpd_12m
		,	count(case when b.months_balance >= -24 and b.status in ('1','2','3','4','5') then 1 end) as dpd_24m
from bureau_balance b
inner join bureau c on b.SK_ID_BUREAU  = c.SK_ID_BUREAU 
group by c.SK_ID_CURR 