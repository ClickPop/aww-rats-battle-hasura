alter table "public"."raids" alter column "faction_raid" set default false;
alter table "public"."raids" alter column "faction_raid" drop not null;
alter table "public"."raids" add column "faction_raid" bool;
