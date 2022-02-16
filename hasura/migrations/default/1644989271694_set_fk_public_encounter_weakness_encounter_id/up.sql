alter table "public"."encounter_weakness" drop constraint "encounter_weakness_encounter_id_fkey",
  add constraint "encounter_weakness_encounter_id_fkey"
  foreign key ("encounter_id")
  references "public"."encounters"
  ("id") on update cascade on delete cascade;
