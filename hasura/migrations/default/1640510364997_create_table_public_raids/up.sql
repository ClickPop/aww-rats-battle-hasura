CREATE TABLE "public"."raids" ("id" serial NOT NULL, "encounter_id" integer NOT NULL, "faction_raid" boolean NOT NULL DEFAULT false, "result" boolean, "active" boolean NOT NULL DEFAULT false, "start_timestamp" timestamptz NOT NULL DEFAULT now(), "end_timestamp" timestamptz NOT NULL DEFAULT now(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("encounter_id") REFERENCES "public"."encounters"("id") ON UPDATE no action ON DELETE no action);
CREATE OR REPLACE FUNCTION "public"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_public_raids_updated_at"
BEFORE UPDATE ON "public"."raids"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_raids_updated_at" ON "public"."raids" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
