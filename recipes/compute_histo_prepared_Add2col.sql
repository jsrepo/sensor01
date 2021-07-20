SELECT *

(DATE_PART('day',"failure_time" - "time")*24*60
    + DATE_PART('hour',"failure_time" - "time")*60
    + DATE_PART('minute',"failure_time" - "time"))/30 as "Nb_Cycles_before_failure" , 

(DATE_PART('day',"time" - "DateRef")*24*60
    + DATE_PART('hour',"time" - "DateRef")*60
    + DATE_PART('minute',"time" - "DateRef"))/30 as "Nb_Cycles"

  FROM "sandbox"."NANAE_SENSORANDFAILURES_histo_joined_prepared",
  
  (
SELECT "unit_id" , max("time") as "failure_time" , 
       TO_TIMESTAMP('07/09/2018 10:00:00', 'DD/MM/YYYY HH24:MI:SS') as "DateRef"
  FROM "${projectKey}_histo_joined_prepared"
  GROUP BY "unit_id"
    ) "R"
WHERE "FD001"."unit_id" = "R"."unit_id"