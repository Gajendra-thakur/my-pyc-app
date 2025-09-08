WITH daily_weather as(

select 
date(time) daily_weather,
weather,
TEMP,
PRESSURE,
HUMIDITY,
CLOUDS
from {{ source('demo', 'weather') }}

),
daily_weather_agg as (
select
daily_weather,
weather,
round(avg(TEMP),2) As avg_temp,
round(avg(PRESSURE),2) as avg_pressure,
round(avg(HUMIDITY),2) as avg_humidity,
round(avg(CLOUDS),2) avg_clouds
from daily_weather
group by daily_weather,weather

qualify ROW_NUMBER() Over (PARTITION BY daily_weather order by count(weather) desc)=1
)

select * from daily_weather_agg
order by daily_weather Asc