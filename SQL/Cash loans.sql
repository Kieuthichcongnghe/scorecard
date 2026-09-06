select a.* from FEATURE_FINAL a
inner join application_train b  on a.SK_ID_CURR  = b.SK_ID_CURR 
WHERE  NAME_CONTRACT_TYPE  = 'Cash loans'