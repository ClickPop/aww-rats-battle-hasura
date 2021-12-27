CREATE TABLE "public"."gauntlets" ("id" serial NOT NULL, "description" text, "win_text" Text, "loss_text" text, "image" text, "active" boolean NOT NULL DEFAULT false, PRIMARY KEY ("id") );
