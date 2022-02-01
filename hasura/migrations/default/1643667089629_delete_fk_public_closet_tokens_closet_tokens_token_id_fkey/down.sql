alter table "public"."closet_tokens"
  add constraint "closet_tokens_token_id_fkey"
  foreign key ("token_id")
  references "public"."closet_pieces"
  ("id") on update restrict on delete restrict;
