GRANT CREATE
	ON SCHEMA sys_flow
	TO sysflow_user;

SELECT * FROM sys_flow.maintenance;

CREATE OR REPLACE VIEW sys_flow.view_insert_t_maintenance_r_sysflow_user AS
	SELECT mai_description, mai_total_price, mai_date_prevision,mai_status, mai_type, mai_id_equipment FROM sys_flow.maintenance;


SET ROLE sysflow_user;

CREATE OR REPLACE FUNCTION
	sys_flow.view_insert_function_t_maintenance_r_sysflow_user()
	RETURNS trigger AS $$
	BEGIN
		INSERT INTO sys_flow.maintenance (
						man_description,
						man_total_price,
						man_prevision_date,
						man_status,
						man_type,
						man_id_equipment)
		VALUES (
						NEW.man_description,
						NEW.man_total_price,
						NEW.prevision_date,
						NEW.status,
						man_type,
						man_id_equipment
		);
		RETURN NEW;

	END;
	$$
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = pg_temp;
RESET ROLE;

CREATE OR REPLACE TRIGGER view_insert_trigger_t_maintenance_r_sysflow_user
INSTEAD OF INSERT ON sys_flow.view_insert_t_maintenance_r_sysflow_user
FOR EACH ROW
EXECUTE FUNCTION sys_flow.view_insert_function_t_maintenance_r_sysflow_user();

