alter table "public"."gauntlet_encounters"
  add constraint "gauntlet_encounters_encounter_id_fkey"
  foreign key ("encounter_id")
  references "public"."encounters"
  ("id") on update no action on delete no action;
