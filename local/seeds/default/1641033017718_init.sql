INSERT INTO "public"."rewards" (tokens)
VALUES (10), (15), (20), (50);

INSERT INTO "public"."encounters" (reward_id, energy_cost, power, name, encounter_type, max_rats)
SELECT id, 5, 5, 'Alley Cat', 'solo', 2
FROM "public"."rewards" 
LIMIT 1;

INSERT INTO "public"."encounters" (reward_id, energy_cost, power, name, encounter_type, max_rats)
SELECT id, 10, 8, 'Slightly Taller Alley Cat', 'solo', 2
FROM "public"."rewards" 
LIMIT 1
OFFSET 1;

INSERT INTO "public"."encounters" (reward_id, energy_cost, power, name, encounter_type, max_rats)
SELECT id, 15, 10, 'A Raccoon', 'solo', 2
FROM "public"."rewards" 
LIMIT 1
OFFSET 2;

INSERT INTO "public"."encounters" (reward_id, energy_cost, power, name, encounter_type, max_rats)
SELECT id, 10, 100, 'Cyborg Seagal', 'community_raid', 1
FROM "public"."rewards" 
LIMIT 1
OFFSET 3;

INSERT INTO "public"."encounters" (reward_id, energy_cost, power, name, encounter_type, max_rats)
SELECT id, 10, 50, 'Rat Bois Heart When No One Wanted To Be A Pet Rat', 'faction_raid', 1
FROM "public"."rewards" 
LIMIT 1
OFFSET 3;

INSERT INTO "public"."encounter_rat_constraints" (encounter_id, rat_type, locked_slots)
SELECT id, 'street', 1
FROM "public"."encounters"
LIMIT 1
OFFSET 2;

INSERT INTO "public"."raids" (reward_id, encounter_id)
SELECT reward_id, id
FROM "public"."encounters"
LIMIT 1
OFFSET 3;

INSERT INTO "public"."raids" (reward_id, encounter_id)
SELECT reward_id, id
FROM "public"."encounters"
LIMIT 1
OFFSET 4;

INSERT INTO "public"."gauntlets" (reward_id)
SELECT id
FROM "public"."rewards" 
LIMIT 1
OFFSET 3;

INSERT INTO "public"."gauntlet_encounters" (encounter_id, gauntlet_id, position)
SELECT "public"."encounters".id, "public"."gauntlets".id, 1
FROM "public"."encounters", "public"."gauntlets"
LIMIT 1;

INSERT INTO "public"."gauntlet_encounters" (encounter_id, gauntlet_id, position)
SELECT "public"."encounters".id, "public"."gauntlets".id, 2
FROM "public"."encounters", "public"."gauntlets"
LIMIT 1
OFFSET 1;

INSERT INTO "public"."gauntlet_encounters" (encounter_id, gauntlet_id, position)
SELECT "public"."encounters".id, "public"."gauntlets".id, 3
FROM "public"."encounters", "public"."gauntlets"
LIMIT 1
OFFSET 2;