{{ config(materialized='table') }}
WITh TRIPS as (

    select 
    distinct
    RIDE_ID,
    RIDEABLE_TYPE,
    DATE(TO_TIMESTAMP(STARTED_AT)) AS TRIP_DATE,
     START_STATIO_ID as START_STATION_ID,
    END_STATION_ID,
    MEMBER_CSUAL as MEMBER_CSUAL,
    TIMESTAMPDIFF(SECOND,TO_TIMESTAMP(STARTED_AT),TO_TIMESTAMP(ENDED_AT)) AS TRIP_DURATION_SECONDS
    From {{ ref('stg_bike') }}
    where RIDE_ID !='ride_id'

    
)

select * from TRIPS