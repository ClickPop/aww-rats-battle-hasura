import {ENCOUNTER_TYPE, PrismaClient, RAT_TYPE} from '@prisma/client';

const client = new PrismaClient();

(async () => {
  await client.reward.createMany({
    data: [
      {
        tokens: 10,
      },
      {
        tokens: 15,
      },
      {
        tokens: 20,
      },
      {
        tokens: 15,
        closetTokens: ['1'],
      },
      {
        tokens: 20,
        closetTokens: ['2'],
      },
      {
        tokens: 60,
      },
    ],
  });
  const rewards = await client.reward.findMany();
  await client.encounter.createMany({
    data: [
      {
        energy_cost: 5,
        encounter_type: ENCOUNTER_TYPE.SOLO,
        max_rats: 2,
        power: 5,
        name: 'Cat',
        rewardId: rewards[0].id,
        active: true,
      },
      {
        energy_cost: 10,
        encounter_type: ENCOUNTER_TYPE.SOLO,
        max_rats: 2,
        power: 8,
        name: 'Buff Cat',
        rewardId: rewards[1].id,
      },
      {
        energy_cost: 15,
        encounter_type: ENCOUNTER_TYPE.SOLO,
        max_rats: 2,
        power: 12,
        name: "Buff Cat's Dad",
        rewardId: rewards[2].id,
      },
      {
        energy_cost: 15,
        encounter_type: ENCOUNTER_TYPE.COMMUNITY_RAID,
        max_rats: 3,
        power: 100,
        name: 'Cat King',
      },
      {
        energy_cost: 5,
        encounter_type: ENCOUNTER_TYPE.FACTION_RAID,
        max_rats: 1,
        power: 50,
        name: 'Cyborg Seagal',
      },
    ],
  });
  const communityRaidEncounter = await client.encounter.findFirst({
    where: {
      encounter_type: ENCOUNTER_TYPE.COMMUNITY_RAID,
    },
  });
  const factionRaidEncounter = await client.encounter.findFirst({
    where: {
      encounter_type: ENCOUNTER_TYPE.FACTION_RAID,
    },
  });
  const soloEncounters = await client.encounter.findMany({
    where: {
      encounter_type: ENCOUNTER_TYPE.SOLO,
    },
  });
  if (
    communityRaidEncounter?.id &&
    factionRaidEncounter?.id &&
    rewards.length > 4
  ) {
    await client.raid.createMany({
      data: [
        {
          encounter_id: communityRaidEncounter.id,
          raid_start_timestamp: new Date(),
          raid_end_timestamp: new Date(),
          rewardId: rewards[3].id,
        },
        {
          encounter_id: factionRaidEncounter.id,
          raid_start_timestamp: new Date(),
          raid_end_timestamp: new Date(),
          rewardId: rewards[4].id,
        },
      ],
    });
  }
  if (soloEncounters?.length === 3) {
    await client.encounter_Rat_Constraints.create({
      data: {
        encounter_id: soloEncounters[0].id,
        rat_type: RAT_TYPE.STREET,
        locked_slots: 1,
      },
    });

    const gauntlet = await client.gauntlet.create({
      data: {
        rewardId: rewards[5].id,
      },
    });

    await client.gauntlet_Encounters.createMany({
      data: [
        {
          gauntlet_id: gauntlet.id,
          encounter_id: soloEncounters[0].id,
          position: 1,
        },
        {
          gauntlet_id: gauntlet.id,
          encounter_id: soloEncounters[1].id,
          position: 2,
        },
        {
          gauntlet_id: gauntlet.id,
          encounter_id: soloEncounters[2].id,
          position: 3,
        },
      ],
    });
  }
  await client.$disconnect();
})();
