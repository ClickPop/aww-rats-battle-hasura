CREATE TABLE "public"."encounter_resistance" ("encounter_id" integer NOT NULL, "resistance" text NOT NULL, PRIMARY KEY ("encounter_id","resistance") , FOREIGN KEY ("encounter_id") REFERENCES "public"."encounters"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("resistance") REFERENCES "public"."rattributes"("rattribute") ON UPDATE restrict ON DELETE restrict);COMMENT ON TABLE "public"."encounter_resistance" IS E'WIll hold encounter\'s weakness';