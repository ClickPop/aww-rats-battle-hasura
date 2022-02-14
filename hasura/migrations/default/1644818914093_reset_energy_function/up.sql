CREATE OR REPLACE FUNCTION reset_energy()
RETURNS SETOF players
AS $$
  UPDATE players SET energy = max_energy WHERE energy < max_energy RETURNING *
$$
 LANGUAGE SQL
 VOLATILE;
