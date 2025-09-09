{{ config(materialized='table') }}
WITh BIKE as (

    select 
    distinct
    start_statio_id as start_station_id,
    start_station_name as station_name,
    start_lat as station_lat,
    start_lng as station_long
    From {{ ref('stg_bike') }}
    where RIDE_ID !='ride_id'
    
)

select * from BIKE