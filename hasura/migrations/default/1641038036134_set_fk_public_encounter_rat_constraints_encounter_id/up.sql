alter table "public"."encounter_rat_constraints"
  add constraint "encounter_rat_constraints_encounter_id_fkey"
  foreign key ("encounter_id")
  references "public"."encounters"
  ("id") on update restrict on delete restrict;
