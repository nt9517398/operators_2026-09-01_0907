SELECT
    date_trunc('hour', time_stamp) AS hour_bucket,
    COUNT("LogNumber") AS total_logs
FROM public.group_table_debarker
WHERE time_stamp BETWEEN :startTime AND :endTime
GROUP BY hour_bucket
ORDER BY hour_bucket ASC;



