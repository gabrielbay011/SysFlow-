
GRANT CREATE
	ON SCHEMA sys_flow
	TO sysflow_user;

CREATE OR REPLACE VIEW sys_flow.view_insert_t_company_r_sysflow_user AS
SELECT com_name, com_cnpj FROM sys_flow.company;

SET ROLE sysflow_user;

CREATE OR REPLACE FUNCTION
	sys_flow.view_insert_function_t_company_r_sysflow_user()
	RETURNS trigger AS $$
	BEGIN
		INSERT INTO sys_flow.company(com_name, com_cnpj) VALUES (NEW.com_name, NEW.com_cnpj);
		RETURN NEW;
	END;
	$$
	LANGUAGE plpgsql
	SECURITY DEFINER
	SET search_path = pg_temp;
	RESET ROLE;

CREATE OR REPLACE TRIGGER view_insert_trigger_t_company_r_sysflow_user
INSTEAD OF INSERT ON sys_flow.view_insert_t_company_r_sysflow_user
FOR EACH ROW
EXECUTE FUNCTION sys_flow.view_insert_function_t_company_r_sysflow_user();


REVOKE CREATE
    ON SCHEMA sys_flow
    FROM sysflow_user;

-- Modo de Usuabilidade
-- INSERT INTO sys_flow.view_insert_t_company_r_sysflow_user (com_name, com_cnpj)
-- VALUES ('Nova Empresa XPTO', '12.345.678/0001-99');

--SELECT * FROM sys_flow.company;