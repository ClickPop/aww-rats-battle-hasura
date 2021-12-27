alter table "public"."gauntlet_encounters"
  add constraint "gauntlet_encounters_gauntlet_id_fkey"
  foreign key ("gauntlet_id")
  references "public"."gauntlets"
  ("id") on update no action on delete no action;
