select
 case
         when time_stamp::time >= '05:00' and time_stamp::time < '06:00' then 5
         when time_stamp::time >= '06:00' and time_stamp::time < '07:00' then 6
         when time_stamp::time >= '07:00' and time_stamp::time < '08:00' then 7
         when time_stamp::time >= '08:00' and time_stamp::time < '09:00' then 8
         when time_stamp::time >= '09:00' and time_stamp::time < '10:00' then 9
         when time_stamp::time >= '10:00' and time_stamp::time < '11:00' then 10
		 when time_stamp::time >= '11:00' and time_stamp::time < '12:00' then 11
		 when time_stamp::time >= '12:00' and time_stamp::time < '13:00' then 12
		 when time_stamp::time >= '13:00' and time_stamp::time < '14:00' then 13
		 when time_stamp::time >= '14:00' and time_stamp::time < '15:00' then 14
		 when time_stamp::time >= '15:00' and time_stamp::time < '16:00' then 15
		 when time_stamp::time >= '16:00' and time_stamp::time < '17:00' then 16
		 when time_stamp::time >= '17:00' and time_stamp::time < '18:00' then 17
		 when time_stamp::time >= '18:00' and time_stamp::time < '19:00' then 18
		 when time_stamp::time >= '19:00' and time_stamp::time < '20:00' then 19
		 when time_stamp::time >= '20:00' and time_stamp::time < '21:00' then 20
		 when time_stamp::time >= '21:00' and time_stamp::time < '22:00' then 21
		 when time_stamp::time >= '22:00' and time_stamp::time < '23:00' then 22
		 when time_stamp::time >= '23:00' and time_stamp::time < '24:00' then 23
		 when time_stamp::time >= '00:00' and time_stamp::time < '01:00' then 0
		 when time_stamp::time >= '01:00' and time_stamp::time < '02:00' then 1
		 when time_stamp::time >= '02:00' and time_stamp::time < '03:00' then 2
		 when time_stamp::time >= '03:00' and time_stamp::time < '04:00' then 3
		 when time_stamp::time >= '04:00' and time_stamp::time < '05:00' then 4 
 end as onehour, 
       count(*) filter (where "LogNumber" <> 0 ) as n
from group_table_debarker
WHERE
			time_stamp <  :date_to
		AND time_stamp >  :date_from
group by onehour
order by onehour asc