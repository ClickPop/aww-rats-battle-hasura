alter table "public"."encounter_rat_constraints"
  add constraint "encounter_rat_constraints_rat_type_fkey"
  foreign key ("rat_type")
  references "public"."rat_types"
  ("rat_type") on update no action on delete no action;
