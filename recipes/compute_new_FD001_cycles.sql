SELECT "FD001".* , 

(DATE_PART('day',"time" - "DateRef")*24*60
    + DATE_PART('hour',"time" - "DateRef")*60
    + DATE_PART('minute',"time" - "DateRef"))/30 as "Nb_Cycles"

    
FROM "${projectKey}_new_fd001_prepared" "FD001", 
(
SELECT "unit_id" , 
       TO_TIMESTAMP('15/09/2018 10:00:00', 'DD/MM/YYYY HH24:MI:SS') as "DateRef"
  FROM "${projectKey}_new_fd001_prepared"
  GROUP BY "unit_id"
    ) "R"
WHERE "FD001"."unit_id" = "R"."unit_id"