CREATE TABLE "public"."encounters" ("id" serial NOT NULL, "energy_cost" integer NOT NULL, "power" Integer NOT NULL, "name" text NOT NULL, "description" text, "win_text" text, "loss_text" text, "image" text, "active" boolean NOT NULL DEFAULT false, "encounter_type" text NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") );
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
CREATE TRIGGER "set_public_encounters_updated_at"
BEFORE UPDATE ON "public"."encounters"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_encounters_updated_at" ON "public"."encounters" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
