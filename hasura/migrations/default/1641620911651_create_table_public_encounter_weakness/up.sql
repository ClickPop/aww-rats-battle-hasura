CREATE TABLE "public"."encounter_weakness" ("encounter_id" integer NOT NULL, "weakness" text NOT NULL, PRIMARY KEY ("encounter_id","weakness") , FOREIGN KEY ("encounter_id") REFERENCES "public"."encounters"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("weakness") REFERENCES "public"."rattributes"("rattribute") ON UPDATE restrict ON DELETE restrict);COMMENT ON TABLE "public"."encounter_weakness" IS E'Will hold the encounter\'s weakness';