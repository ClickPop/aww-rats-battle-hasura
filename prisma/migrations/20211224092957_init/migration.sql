-- CreateEnum
CREATE TYPE "RAT_TYPE" AS ENUM ('LAB', 'PACK', 'PET', 'STREET');

-- CreateEnum
CREATE TYPE "RATTRIBUTE" AS ENUM ('CUNNING', 'CUTENESS', 'RATTITUDE');

-- CreateEnum
CREATE TYPE "ENCOUNTER_TYPE" AS ENUM ('SOLO', 'COMMUNITY_RAID', 'FACTION_RAID');

-- CreateTable
CREATE TABLE "Player" (
    "id" TEXT NOT NULL,
    "energy" INTEGER NOT NULL DEFAULT 0,
    "max_energy" INTEGER NOT NULL DEFAULT 0,
    "xp" INTEGER NOT NULL DEFAULT 0,
    "level" INTEGER NOT NULL DEFAULT 1,
    "create_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Player_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Encounter" (
    "id" SERIAL NOT NULL,
    "energy_cost" INTEGER NOT NULL,
    "power" INTEGER NOT NULL,
    "encounter_type" "ENCOUNTER_TYPE" NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "win_text" TEXT,
    "loss_text" TEXT,
    "image" TEXT,
    "max_rats" INTEGER NOT NULL,
    "weaknesses" "RATTRIBUTE"[],
    "resistances" "RATTRIBUTE"[],
    "rewardId" INTEGER,
    "active" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Encounter_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Encounter_Rat_Constraints" (
    "encounter_id" INTEGER NOT NULL,
    "rat_type" "RAT_TYPE" NOT NULL,
    "locked_slots" INTEGER NOT NULL,

    CONSTRAINT "Encounter_Rat_Constraints_pkey" PRIMARY KEY ("encounter_id","rat_type")
);

-- CreateTable
CREATE TABLE "Solo_Encounter_Results" (
    "id" SERIAL NOT NULL,
    "player_id" TEXT NOT NULL,
    "encounter_id" INTEGER NOT NULL,
    "result" BOOLEAN NOT NULL,
    "completed_timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Solo_Encounter_Results_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Raid" (
    "id" SERIAL NOT NULL,
    "encounter_id" INTEGER NOT NULL,
    "faction_raid" BOOLEAN NOT NULL DEFAULT false,
    "result" BOOLEAN,
    "raid_start_timestamp" TIMESTAMP(3) NOT NULL,
    "raid_end_timestamp" TIMESTAMP(3) NOT NULL,
    "rewardId" INTEGER NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Raid_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Raid_Contribution" (
    "player_id" TEXT NOT NULL,
    "raid_id" INTEGER NOT NULL,
    "contribution" INTEGER NOT NULL,
    "faction" TEXT,
    "contribution_timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Raid_Contribution_pkey" PRIMARY KEY ("player_id","raid_id")
);

-- CreateTable
CREATE TABLE "Gauntlet" (
    "id" SERIAL NOT NULL,
    "description" TEXT,
    "win_text" TEXT,
    "loss_text" TEXT,
    "image" TEXT,
    "rewardId" INTEGER NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Gauntlet_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Gauntlet_Encounters" (
    "gauntlet_id" INTEGER NOT NULL,
    "encounter_id" INTEGER NOT NULL,
    "position" INTEGER NOT NULL,

    CONSTRAINT "Gauntlet_Encounters_pkey" PRIMARY KEY ("gauntlet_id","encounter_id")
);

-- CreateTable
CREATE TABLE "Gauntlet_Attempts" (
    "id" SERIAL NOT NULL,
    "gauntlet_id" INTEGER NOT NULL,
    "player_id" TEXT NOT NULL,
    "result" BOOLEAN,
    "last_attempted_encounter_id" INTEGER NOT NULL,
    "completed_timestamp" TIMESTAMP(3),
    "started_timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Gauntlet_Attempts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Reward" (
    "id" SERIAL NOT NULL,
    "tokens" INTEGER NOT NULL,
    "closetTokens" TEXT[],

    CONSTRAINT "Reward_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Player_id_key" ON "Player"("id");

-- AddForeignKey
ALTER TABLE "Encounter" ADD CONSTRAINT "Encounter_rewardId_fkey" FOREIGN KEY ("rewardId") REFERENCES "Reward"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Encounter_Rat_Constraints" ADD CONSTRAINT "Encounter_Rat_Constraints_encounter_id_fkey" FOREIGN KEY ("encounter_id") REFERENCES "Encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Solo_Encounter_Results" ADD CONSTRAINT "Solo_Encounter_Results_player_id_fkey" FOREIGN KEY ("player_id") REFERENCES "Player"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Solo_Encounter_Results" ADD CONSTRAINT "Solo_Encounter_Results_encounter_id_fkey" FOREIGN KEY ("encounter_id") REFERENCES "Encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Raid" ADD CONSTRAINT "Raid_encounter_id_fkey" FOREIGN KEY ("encounter_id") REFERENCES "Encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Raid" ADD CONSTRAINT "Raid_rewardId_fkey" FOREIGN KEY ("rewardId") REFERENCES "Reward"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Raid_Contribution" ADD CONSTRAINT "Raid_Contribution_player_id_fkey" FOREIGN KEY ("player_id") REFERENCES "Player"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Raid_Contribution" ADD CONSTRAINT "Raid_Contribution_raid_id_fkey" FOREIGN KEY ("raid_id") REFERENCES "Raid"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Gauntlet" ADD CONSTRAINT "Gauntlet_rewardId_fkey" FOREIGN KEY ("rewardId") REFERENCES "Reward"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Gauntlet_Encounters" ADD CONSTRAINT "Gauntlet_Encounters_gauntlet_id_fkey" FOREIGN KEY ("gauntlet_id") REFERENCES "Gauntlet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Gauntlet_Encounters" ADD CONSTRAINT "Gauntlet_Encounters_encounter_id_fkey" FOREIGN KEY ("encounter_id") REFERENCES "Encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Gauntlet_Attempts" ADD CONSTRAINT "Gauntlet_Attempts_gauntlet_id_fkey" FOREIGN KEY ("gauntlet_id") REFERENCES "Gauntlet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Gauntlet_Attempts" ADD CONSTRAINT "Gauntlet_Attempts_player_id_fkey" FOREIGN KEY ("player_id") REFERENCES "Player"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Gauntlet_Attempts" ADD CONSTRAINT "Gauntlet_Attempts_last_attempted_encounter_id_fkey" FOREIGN KEY ("last_attempted_encounter_id") REFERENCES "Encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
