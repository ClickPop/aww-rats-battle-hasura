alter table "public"."encounter_resistance" drop constraint "encounter_resistance_encounter_id_fkey",
  add constraint "encounter_resistance_encounter_id_fkey"
  foreign key ("encounter_id")
  references "public"."encounters"
  ("id") on update restrict on delete restrict;
