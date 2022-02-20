alter table "public"."encounter_rat_constraints"
  add constraint "encounter_rat_constraints_external_contract_fkey"
  foreign key ("external_contract")
  references "public"."external_contracts"
  ("address") on update no action on delete no action;
