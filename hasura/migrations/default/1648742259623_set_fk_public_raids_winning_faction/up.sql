alter table "public"."raids"
  add constraint "raids_winning_faction_fkey"
  foreign key ("winning_faction")
  references "public"."rat_types"
  ("rat_type") on update no action on delete no action;
