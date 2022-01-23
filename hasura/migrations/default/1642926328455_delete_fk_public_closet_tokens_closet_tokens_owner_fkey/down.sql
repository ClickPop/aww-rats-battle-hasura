alter table "public"."closet_tokens"
  add constraint "closet_tokens_owner_fkey"
  foreign key ("owner")
  references "public"."players"
  ("id") on update restrict on delete restrict;
