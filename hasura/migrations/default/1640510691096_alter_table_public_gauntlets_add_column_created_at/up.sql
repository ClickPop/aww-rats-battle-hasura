alter table "public"."gauntlets" add column "created_at" timestamptz
 null default now();
