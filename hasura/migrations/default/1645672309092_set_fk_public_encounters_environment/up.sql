alter table "public"."encounters"
  add constraint "encounters_environment_fkey"
  foreign key ("environment")
  references "public"."encounter_environments"
  ("encounter_environment") on update no action on delete no action;
