alter table "public"."rats"
  add constraint "rats_owner_fkey"
  foreign key ("owner")
  references "public"."players"
  ("id") on update restrict on delete restrict;
