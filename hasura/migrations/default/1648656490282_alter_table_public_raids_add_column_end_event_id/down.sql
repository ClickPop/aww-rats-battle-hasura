-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."raids" add column "end_event_id" text
--  null;
alter table "public"."raids" drop column "end_event_id" cascade;
