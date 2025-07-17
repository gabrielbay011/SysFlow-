
GRANT CREATE
	ON SCHEMA sys_flow
	TO sysflow_test_user;

CREATE OR REPLACE VIEW sys_flow.view_insert_t_company_r_sysflow_test_user AS
SELECT com_name, com_cnpj FROM sys_flow.company;

SET ROLE sysflow_test_user;

CREATE OR REPLACE FUNCTION
	sys_flow.view_insert_function_t_company_r_sysflow_test_user()
	RETURNS trigger AS $$
	BEGIN
		INSERT INTO sys_flow.company(com_name, com_cnpj) VALUES (NEW.com_name, NEW.com_cnpj);
		RETURN NEW;
	END;
	$$
	LANGUAGE plpgsql
	SECURITY DEFINER
	SET search_path = sys_flow, pg_temp;
	RESET ROLE;

CREATE OR REPLACE TRIGGER view_insert_trigger_t_company_r_sysflow_test_user
INSTEAD OF INSERT ON sys_flow.view_insert_t_company_r_sysflow_test_user
FOR EACH ROW
EXECUTE FUNCTION sys_flow.view_insert_function_t_company_r_sysflow_test_user();




