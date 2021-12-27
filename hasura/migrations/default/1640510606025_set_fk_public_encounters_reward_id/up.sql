alter table "public"."encounters"
  add constraint "encounters_reward_id_fkey"
  foreign key ("reward_id")
  references "public"."rewards"
  ("id") on update no action on delete no action;
