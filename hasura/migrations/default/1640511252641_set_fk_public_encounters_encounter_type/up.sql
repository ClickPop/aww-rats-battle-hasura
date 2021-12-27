alter table "public"."encounters"
  add constraint "encounters_encounter_type_fkey"
  foreign key ("encounter_type")
  references "public"."encounter_types"
  ("encounter_type") on update no action on delete no action;
