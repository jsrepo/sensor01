SELECT "T"."unit_id", "T"."Nb_Cycles", "T"."prediction", "T"."proba_long", "T"."proba_medium", "T"."proba_short", "T"."proba_urgent"
FROM "sandbox"."NANAE_SENSORANDFAILURES_new_fd001_to_scored" "T",
(
SELECT 
"unit_id" , max("Nb_Cycles") as "max_cycle"
FROM "sandbox"."sandbox"."NANAE_SENSORANDFAILURES_new_fd001_to_scored"
WHERE "prediction" in ('urgent','short')
GROUP BY "unit_id"
) R
WHERE "T"."unit_id" = R."unit_id"
AND "T"."Nb_Cycles" = R."max_cycle" 