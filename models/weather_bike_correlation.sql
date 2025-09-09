WITH CTE AS (

    select 
   t.*,
   w.*
     from {{ ref('trip_fact') }} t
    left join {{ ref('daily_weather') }} w
    on t.TRIP_DATE=w.daily_weather
    order by TRIP_DATE,daily_weather desc
    
)

select * from CTE